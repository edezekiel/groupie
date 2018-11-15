class CommandLineInterface

  # pastel is a gem that adds color to this program.
  def pastel
    pastel = Pastel.new
    pastel
  end

  # creates visual separations in the command line while program runs
  def separator
    pastel
    puts "                                                      "
    puts pastel.bright_magenta("======================================================")
    puts "                                                      "
  end

  # general method that allows the user to exit the program
  def exit
    puts "Thank you for using #{pastel.bright_cyan('Groupie')}!"
    separator
  end

  # general method that outputs whenever user types something random
  def unrecognized_input
    puts "Input not recognized or is invalid."
    exit
  end

  # greets the user and provides basic instructions.
  def greet
    separator
    puts "Welcome to #{pastel.bright_cyan('Groupie')}."
    puts "Keep up with your favorite bands, never miss a show!"
    puts "Type #{pastel.bright_cyan('exit')} at any time to quit the app."
    puts "Type #{pastel.bright_cyan('concerts')} to get started."
    separator
  end

  # greet method asks user to type "concerts." This method gets user input and validates that input.
  def validate_first_entry
    input = gets.chomp
    if input == "concerts"
      @concert_input_validated = "true"
    elsif input == "exit"
      exit
    else
      unrecognized_input
    end
  end

  # first, the terminal displays a full list of all the top concerts.
  def list_all_concerts
    puts "Here are the top U.S. music concerts:"
    puts "                                                      "
    Concert.all.each do |concert|
      puts "#{concert.id}. #{concert.title}"
    end
    separator
  end

  # then, user is prompted to select their favorite concert.
  def prompt_to_type_concert_number
    puts "Type the concert number to see the headlining bands."
    puts "For example, type #{pastel.bright_cyan("2")} to see Electric Zoo's headliners."
    separator
  end

  # next, the program collects the user's input and validated it.
  def validate_concert_number_input
    input = gets.chomp
    separator
    if input.to_i > Concert.count
      unrecognized_input
    elsif input.to_i < 0
      unrecognized_input
    # if user makes an accetable concert choice, they are walked through ticket purchase options.
    elsif input.to_i > 0
      @concert_number_input_validated = "true"
      @concert_number = input
    elsif input == "exit"
      exit
    else
      unrecognized_input
    end
  end

  # the terminal then prints out the bands playing at the selected concert
  def print_bands_for_concert_id(user_input)
    puts "Here are the headliners for the concert you selected:"
    puts "                                                      "
    selected_bands = Concert.find(user_input).bands
    selected_bands.each do |band|
      puts band.name
    end
    separator
  end

  # the terminal then prompts the user to purchase a ticket.
  def prompt_to_buy_ticket
    puts "Tickets for this concert cost $#{rand(100...500)}.00."
    puts "Would you like to buy a ticket?"
    puts "(#{pastel.bright_cyan('0')} = no, #{pastel.bright_cyan('1')} = yes)."
    separator
  end

  # the user can choose to buy a ticket, go back, or exit the proram.
  def purchase_option_decision_tree
    input = gets.chomp
    separator
    # if they buy a ticket, the program will confirm purchase and then quit.
    if input.to_i == 1
      puts "Your mobile ticket will arrive soon."
      exit
    elsif input == "exit"
      exit
    # if they don't want that ticket, they can see the full band list and get more information.
    elsif input == "0"
      @buy_ticket = "true"
    else
      unrecognized_input
    end
  end

  # if user rejects ticket offer, they can look for other upcoming bands and/or concerts by typing bands.
  def prompt_to_type_bands
    puts "Don't see your favorite band? Type #{pastel.bright_cyan('bands')} to see a list"
    puts "of the top 2019 concert headliners."
    puts "Type #{pastel.bright_cyan('exit')} at any time to quit the app."
    separator
  end

  # the program collects the user's input and validated it.
  def validate_bands_input
    input = gets.chomp
    separator
    if input == "bands"
      @bands_input_validated = "true"
    elsif input == "exit"
      exit
    else
      unrecognized_input
    end
  end

  # Once "bands" input is validated, user is walked through the rest of the program.

  # the terminal then prints out the full band list
  def list_all_bands
    puts "Here are the top headliners:"
    puts "                                                      "
    Band.all.each do |band|
      puts "#{band.id}. #{band.name}"
    end
    separator
  end

  # after that, the terminal prompts the user to select their favorite band
  def prompt_to_type_band_number
    puts "Type the band number to their upcoming concerts."
    puts "For example, type #{pastel.bright_cyan("3")} to see Jack White's concerts."
    separator
  end

  # user's input is then validated. User can exit or see see list of concerts for their selected band.
  def validate_band_number_input
    input = gets.chomp
    separator
    if input.to_i > Band.count
      unrecognized_input
    elsif input.to_i < 0
      unrecognized_input
    elsif input.to_i > 0
      # if user types a valid band number, they are prompted to buy a ticket.
      @band_number = input
      @bands_input_number_validated = "true"
    elsif input == "exit"
      exit
    else
      unrecognized_input
    end
  end

  # prints out the concerts where the selected band is playing
  def list_all_concerts_for_band_id(user_input)
    puts "That band is playing in these concerts:"
    puts "                                                      "
    selected_concerts = Band.find(user_input).concerts
    selected_concerts.each do |concert|
      puts concert.title
    end
    separator
  end

  # this function is called by the run.rb file
  def run

    greet
    validate_first_entry


    if @concert_input_validated
      list_all_concerts
      prompt_to_type_concert_number
      validate_concert_number_input
    end
    if @concert_number_input_validated
      print_bands_for_concert_id(@concert_number)
      prompt_to_buy_ticket
      purchase_option_decision_tree
    end
    if @buy_ticket
      prompt_to_type_bands
      validate_bands_input
    end
    if @bands_input_validated
      list_all_bands
      prompt_to_type_band_number
      validate_band_number_input
    end
    if @bands_input_number_validated
      list_all_concerts_for_band_id(@band_number)
      prompt_to_buy_ticket
      purchase_option_decision_tree
    end
    exit
  end
end
