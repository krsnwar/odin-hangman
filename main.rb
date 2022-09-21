require_relative "hangman.rb"
require_relative "client.rb"
require_relative "file_handler.rb"

def play
  client = Client.new
  file = FileHandler.new
  client.start_game
  hangman = Hangman.new(client.game_mode, file.get_word_collection, client.game_mode == "2" ? file.get_saved_game : nil)
  hangman.get_random_word
  while !hangman.win do
    hangman.check_answer(client.user_tries(hangman.word_chosen, hangman.guessed_state))
  end
end

play
