class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    returned_check = self.find_by_name(name)
    return returned_check if returned_check
    self.create_by_name(name) 
  end

  def self.alphabetical
    @@all.sort_by {|song|song.name}
  end

  def self.new_from_filename(file_name)
    split_effort = self.get_proper_names(file_name,['.mp3',' - '])
    new_song = self.create_by_name(split_effort[1])
    new_song.artist_name = split_effort[0]
    new_song
  end

  def self.create_from_filename(file_name)
    split_effort = self.get_proper_names(file_name,['.mp3',' - '])
    new_song = self.create_by_name(split_effort[1])
    new_song.artist_name = split_effort[0]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
  
  def self.get_proper_names(file_name,delimiters)
    file_name_splitted = file_name.split(Regexp.union(delimiters))
    file_name_splitted = file_name_splitted.reject { |each_entry_in_array| each_entry_in_array.empty? }
    file_name_splitted
  end

end
#require "pry"
#Song.new_by_name("Basri")
#0