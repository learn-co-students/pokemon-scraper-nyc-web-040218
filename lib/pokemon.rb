require 'sqlite3'
require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(param_hash)
    param_hash.each {|key, value|
    self.send("#{key}=", value)}
  end

  def self.save(name, type, db)
    stm = db.prepare ("INSERT INTO pokemon (name, type) VALUES (:name_, :type_)")
    stm.bind_param("name_", name)
    stm.bind_param("type_", type)
    stm.execute
    stm.close
  end

  def self.find(id, db)
    stm = db.prepare("SELECT id, name, type FROM pokemon WHERE id = :id_")
    stm.bind_param("id_", id)
    stm.execute
    db_reqst_array = stm.to_a[0]
    stm.close
    Pokemon.new({id: db_reqst_array[0], name: db_reqst_array[1], type: db_reqst_array[2]})
  end


end
