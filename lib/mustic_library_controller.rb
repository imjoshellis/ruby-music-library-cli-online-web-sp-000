require 'pry'

class MusicLibraryController
  attr_accessor

  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def list_songs
    Song.all.sort_by{|song| song.name}
      .each_with_index{|song, idx| puts "#{(idx+1).to_s}. #{song.artist} - #{song.name} - #{song.genre}"}
  end

  def list_artists
    Artist.all.sort_by{|item| item.name}.each_with_index{|item, idx| puts (idx+1).to_s + ". " + item.name}
  end

  def list_genres
    Genre.all.sort_by{|item| item.name}.each_with_index{|item, idx| puts (idx+1).to_s + ". " + item.name}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    response = gets.chomp
    response.songs.sort_by{|song| song.name}.each_with_index{|song, idx| puts "#{(idx+1).to_s}. #{song.name} - #{song.genre}"}
  end

  def call
    response = ""
    while response != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      response = gets.chomp
      case response
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      end
    end
  end
end
