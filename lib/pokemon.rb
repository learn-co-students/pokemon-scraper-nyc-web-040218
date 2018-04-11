require "pry"

class Pokemon
 
  attr_accessor :name, :type, :db, :id
  
  @@all = []
 
  def initialize(db)
    @name = db[:name]
    @type = db[:type]
    @id = db[:id]
    @db = db[:db]
  end
 
  def self.all
    @@all
  end

  # db = SQLite3::Database.new('db/pokemon.db')
 
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type) 
      VALUES(?, ?);
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    db.results_as_hash=true
    sql = <<-SQL
      SELECT *
      FROM pokemon 
      WHERE id=?;
    SQL
    output = db.execute(sql, id)
    output = output[0].to_a
    # binding.pry
    Pokemon.new({id:output[0][1], name:output[1][1], type:output[2][1]})
  end

end

