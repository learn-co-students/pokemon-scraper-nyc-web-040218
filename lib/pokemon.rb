class Pokemon

  attr_reader :id
  attr_accessor :name, :type, :db

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_row = db.execute("SELECT * FROM pokemon WHERE id=?", id)
    Pokemon.new({id: pokemon_row[0][0], name: pokemon_row[0][1], type: pokemon_row[0][2]})
  end

end
