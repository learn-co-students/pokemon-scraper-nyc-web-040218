class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(attributes, hp = nil)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    self.send(("hp="), hp)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pikachu_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pikachu_hash = {id: pikachu_array[0], name: pikachu_array[1], type: pikachu_array[2], hp: 60, db: db}
    self.new(pikachu_hash)
  end
end
