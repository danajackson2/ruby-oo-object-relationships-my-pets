class Owner
  attr_reader :name, :species
  
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat|cat.owner == self}
  end

  def dogs
    Dog.all.select{|cat|cat.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.map{|dog| dog.mood = "happy" if dog.owner == self}
  end

  def feed_cats
    Cat.all.map{|cat| cat.mood = "happy" if cat.owner == self}
  end

  def sell_pets
    Dog.all.map{|dog| dog.mood = "nervous"}
    Dog.all.map{|dog| dog.owner = nil}
    Cat.all.map{|cat| cat.mood = "nervous"}
    Cat.all.map{|cat| cat.owner = nil}
  end

  def list_pets
    dog_count = 0
    cat_count = 0
    Dog.all.each{|dog| dog_count += 1 if dog.owner == self}
    Cat.all.each{|cat| cat_count += 1 if cat.owner == self}
    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end