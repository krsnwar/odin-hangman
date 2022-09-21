require "colorize"

class Client
  attr_accessor :game_mode

  def initialize
    @game_mode = nil
    @sets_choose_game = ["1", "2"]
    @sets_of_char = set_sets_of_char
  end

  def start_game
    welcome_message
    @game_mode = user_choose_game
    puts @game_mode == "2" ? "Please continue the game" : "Starting a new game..."
  end

  def welcome_message
    output = <<~end
      +-----------------------------------------------------------------------+
      |                        WELCOME TO HANGMAN GAME                        |
      +-----------------------------------------------------------------------+
      |                                 HINT                                  |
      |      Please make a guess based on a chosen word by inputting letter   |
      |                You have 6 lives (chances) to guess wrong              |
      |                             HAPPY PLAYING                             |
      +-----------------------------------------------------------------------+
    end
    puts output.yellow
  end

  def user_choose_game
    output = <<~end
      |             Press 1 to start new game | Press 2 to load game          |
      +-----------------------------------------------------------------------+
    end
    puts output.yellow
    input = get_user_input
    while !valid_user_input?(input, 1, @sets_choose_game) do
      puts "Wrong input! You only allowed to input #{@sets_choose_game.join(", ")}"
      input = get_user_input
    end
    input
  end

  def play_game(word_chosen, guessed_state, lives)
    
  end

  def user_tries(word_chosen, guessed_state)
    if !!guessed_state
      current_word = "_"*word_chosen.length
      print current_word
      puts
    else
      print guessed_state.join("")
      puts
    end
    puts "Input your guessed character: "    
    input = get_user_input
    while !valid_user_input?(input, 1, @sets_of_char) do
      puts "Wrong input! Please input an alphabet letter"
      input = get_user_input
    end
    input.downcase
  end

  def set_sets_of_char
    sets = []
    for i in 97..122
      sets.push(i.chr)
    end
    sets
  end

  def set_game_mode(mode)
    @game_mode = mode
  end

  def get_user_input
    user_input = gets.chomp
  end

  def valid_user_input?(user_input, length, sets_of_char)
    user_input.length == length && sets_of_char.include?(user_input)
  end

end