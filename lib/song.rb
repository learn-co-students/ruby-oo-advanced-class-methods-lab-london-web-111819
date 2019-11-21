require "pry"

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
    new_song = Song.new
    @@all.push(new_song)
    new_song
  end

  def self.new_by_name(string)
    new_song = Song.new
    new_song.name = string
    new_song
  end

  def self.create_by_name(string)
    new_song = Song.new
    new_song.name = string
    @@all.push(new_song)
    new_song
  end

  def self.find_by_name(target)
    @@all.find do |song|
      song.name == target
    end
  end

  def self.find_or_create_by_name(string)
    if !find_by_name(string)
      create_by_name(string)
    else
      find_by_name(string)
    end
  end

  def self.alphabetical
    @@all.sort_by do |word|
      word.name
    end
  end

  def self.new_from_filename(format)
    new_song = Song.new
    new_song.name = format.split(/\s*[-.]\s*/)[1]
    new_song.artist_name = format.split(/\s*[-.]\s*/)[0]
    new_song
  end

  def self.create_from_filename(format)
    @@all.push(new_from_filename(format))
  end

  def self.destroy_all
    @@all.clear
  end
end