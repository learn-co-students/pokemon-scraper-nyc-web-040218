require 'pry'
class Pokemon

attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        # binding.pry
    Pokemon.new(id: pokemon_data[0][0], name: pokemon_data[0][1], type: pokemon_data[0][2], db: db)
  end

end
