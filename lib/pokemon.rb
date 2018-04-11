class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(data_hash)
    @id = data_hash[:id]
    @name = data_hash[:name]
    @type = data_hash[:type]
    @db = data_hash[:db]

    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);",name, type)
  end

  def self.find(id, database)
    pokemans = database.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new({id: pokemans[0], name: pokemans[1], type: pokemans[2], db: database})
  end
  
end
