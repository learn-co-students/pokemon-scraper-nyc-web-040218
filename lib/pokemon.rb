require 'pry'
require 'sqlite3'
class Pokemon

  attr_accessor :name, :type, :id, :db

  @@all = []

  def initialize(db)
    @name = db[:name]
    @type = db[:type]
    @id = db[:id]
    @db =db[:db]
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type) VALUES(?, ?);
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id_num, db)
    db.results_as_hash = true
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?;
    SQL
    output = db.execute(sql, id_num)
    output = output[0].to_a
    Pokemon.new({id:output[0][1], name:output[1][1], type:output[2][1]})
  end
end
