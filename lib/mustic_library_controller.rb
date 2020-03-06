class MusicLibraryController
  attr_accessor

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end
