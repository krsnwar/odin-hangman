require "json"

class FileHandler

  def get_word_collection
    File.readlines('google-10000-english-no-swears.txt').map(&:chomp)
  end

  def get_saved_game
    JSON.load File.read("state.json")
  end

end