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

def validate_contact_info(*arg)
  valid_input?(arg[0], :name) &&
  valid_input?(arg[1], :number) &&
  valid_input?(arg[2], :email) &&
  valid_input?(arg[3], :category)
end

name = 'Matin'
number = ''
email = ''
category = '3'

p validate_contact_info(name, number, email, category)