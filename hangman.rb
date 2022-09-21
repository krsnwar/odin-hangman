class Hangman
  attr_accessor :word_chosen, :guessed_state, :lives, :win
  
  def initialize(game_mode, word_collection, load_data = nil)
    @game_mode = game_mode
    @word_collection = word_collection
    if load_data.nil?
      @word_chosen = nil
      @lives = 6
      @guessed_state = []
      @win = false
    else
      @word_chosen = nil #diisi state
      @lives = 6 #diisi sisa lives
      @guessed_state = [] #diisi array jawaban
      @win = false
    end
  end

  def get_random_word
    if @word_chosen.nil?
      rand_index = rand(0..@word_collection.length)
      while not @word_collection[rand_index].length.between?(5, 12) do
        rand_index = rand(0..@word_collection.length)
      end
      @word_chosen = @word_collection[rand_index].split("")
    end
  end

  def set_word_collection(words_arr)
    @word_collection = words_arr
  end

  def check_answer(char)
    if @word_chosen.include?(char)
      puts "karakter tertebak"
    else
      puts "karakter salah tebak"
    end
  end

end