require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :hp, :id
  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @id = id
    @db = db
    @hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(*arr)
    id = arr[0]
    new_db = arr[1]
    # new_db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    new_pokemon = new_db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pika = Pokemon.new({:name => new_pokemon[0][1], :type => new_pokemon[0][2], :id => new_pokemon[0][0], :db => new_db})
    pika
  end
end

# For Bonus:
# ALTER TABLE pokemon ADD hp INTEGER DEFAULT 60;
