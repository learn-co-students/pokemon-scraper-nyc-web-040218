require "pry"
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  def initialize(hash)
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @id = hash[:id]
    @hp = hash[:hp]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
  poke_new =  Pokemon.new({id: poke[0],name: poke[1], type: poke[2], :db => db} )

end
end
