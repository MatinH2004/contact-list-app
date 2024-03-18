require "pg"

class DatabasePersistence
  def initialize(logger)
    @db = PG.connect(dbname: "contacts")
    @logger = logger
  end

  def query(statement, *params)
    @logger.info("#{statement}: #{params}")
    @db.exec_params(statement, params)
  end

  def load_contacts
    sql = <<~SQL
    SELECT c.id, "name", "number", email, category 
      FROM contacts c 
      JOIN categories ct 
        ON ct.id = c.category_id
        ORDER BY c.id DESC;
    SQL

    result = query(sql)

    result.map do |tuple|
      {
        id: tuple["id"],
        name: tuple["name"],
        email: tuple["email"],
        number: tuple["number"],
        category: tuple["category"]
      }
    end
  end

  def sort_contacts(sort)
    sql = <<~SQL
    SELECT c.id, "name", "number", email, category 
    FROM contacts c 
    JOIN categories ct 
      ON ct.id = c.category_id
      ORDER BY #{sort};
    SQL

    result = query(sql)

    result.map do |tuple|
      {
        id: tuple["id"],
        name: tuple["name"],
        email: tuple["email"],
        number: tuple["number"],
        category: tuple["category"]
      }
    end
  end

  def add_contact(name, number, email, category)
    sql = <<~SQL
    INSERT INTO contacts ("name", "number", email, category_id)
      VALUES ($1, $2, $3, $4);
    SQL

    query(sql, name, number, email, category)
  end

  def delete_contact(id)
    sql = "DELETE FROM contacts WHERE id = $1"
    query(sql, id)
  end

  def disconnect
    @db.close
  end
end
