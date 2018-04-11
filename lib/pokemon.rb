require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  @@gym = []

  def initialize(details)
    details.each {|attribute, value| self.send("#{attribute}=", value)}
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    pokedata = db.execute('SELECT * FROM pokemon WHERE id = ?', id)
    Pokemon.new(id: pokedata[0][0], name: pokedata[0][1], type: pokedata[0][2], db: db)
  end
end

