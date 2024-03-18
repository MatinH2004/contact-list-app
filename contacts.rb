require "sinatra"
require "tilt/erubis"

require_relative "database_persistence"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
  set :erb, :escape_html => true
end

configure(:development) do
  require "sinatra/reloader"
  also_reload("database_persistence.rb")
end

def valid_input?(str, type)
  case type
  when :name
    !str.strip.empty?
  when :email
    return true if str.strip.empty?
    str.split('@').size == 2 && str.split('.').size >= 2
  when :number
    return true if str.strip.empty?
    # match strings with numbers and spaces
    str.match?(/\A\s*\d+(\s+\d+)*\s*\z/)
  when :category
    # match a string that is a single digit 
    str.size == 1 && "123".include?(str)
  end
end

def valid_contact_info?(*arg)
  valid_input?(arg[0], :name) &&
  valid_input?(arg[1], :number) &&
  valid_input?(arg[2], :email) &&
  valid_input?(arg[3], :category)
end

before do
  @storage = DatabasePersistence.new(logger)
  @sorting_options = ["name", "number", "email", "category_id"]
end

get "/" do
  @contacts = @storage.load_contacts.first(10)
  erb :index
end

get "/view" do
  @contacts = @storage.load_contacts
  erb :view
end

post "/sort" do
  sort = params[:sort]
  @contacts = @storage.sort_contacts(sort)
  erb :view
end

get "/new" do
  erb :new
end

post "/new" do
  name = params[:name]
  number = params[:number]
  email = params[:email]
  category = params[:category]

  if valid_contact_info?(name, number, email, category)
    @storage.add_contact(name, number, email, category)
    session[:message] = "Contact added successfully!"
    redirect "/"
  else
    session[:message] = "Invalid input. Makesure to provide a name and category!"
    erb :new
  end
end

post "/delete/:id" do
  id = params[:id]
  @storage.delete_contact(id)
  session[:message] = "Contact deleted!"
  redirect "/view"
end

after do
  @storage.disconnect
end
