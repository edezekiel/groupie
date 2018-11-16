class CommandLineInterface

  # Pastel is a gem that adds color to this program.
  def pastel
    pastel = Pastel.new
    pastel
  end

  # Creates visual separations in the command line while program runs
  def separator
    pastel
    puts "                                                      "
    puts pastel.bright_magenta("======================================================")
    puts "                                                      "
  end

  # General method that allows the user to exit_screen the program
  def exit_screen
    puts "Thank you for using #{pastel.bright_cyan('Groupie')}!"
    separator
    exit
  end

  # General method that outputs whenever user types something random
  def unrecognized_input
    puts "Input not recognized or is invalid."
    exit_screen
  end

  # Greet method asks user to type "concerts."
  # The greet screen gets user input and validates that input.
  # If the input is "concerts," this method transition to the concert screen.
  def greet_screen
    separator
    welcome_user
    separator
    input = gets.chomp
    if input == "concerts"
        concert_screen
    elsif input == "exit"
      exit_screen
    else
      unrecognized_input
    end
  end

  # Greets the user and provides basic instructions.
  def welcome_user
    puts "Welcome to #{pastel.bright_cyan('Groupie')}."
    puts "Keep up with your favorite bands, never miss a show!"
    puts "Type #{pastel.bright_cyan('exit')} at any time to quit the app."
    puts "Type #{pastel.bright_cyan('concerts')} to get started."
  end

  # the terminal displays a full list of all the top concerts.
  # then, user is prompted to select their favorite concert.
  # next, the program collects the user's input and validated it.
  def concert_screen
    separator
    list_all_concerts
    separator
    prompt_to_type_concert_number
    separator
    concert_id = validate_concert_number_input
    individual_concert_screen(concert_id)
  end

  def list_all_concerts
    puts "  "
    puts "#{pastel.bright_cyan("Here are the top US music concerts in 2019:")}"
    puts "                                                      "
    Concert.all.each do |concert|
      puts "#{concert.id}. #{concert.title}"
    end
  end

  def prompt_to_type_concert_number
    puts "Type the concert number to see the headlining bands."
    puts "For example, type #{pastel.bright_cyan("2")} to see Electric Zoo's headliners."
  end

  def validate_concert_number_input
    input = gets.chomp
    # if user makes an accetable concert choice, they are walked through ticket purchase options.
    if input.to_i > 0 && input.to_i < Concert.count
      input.to_i
    elsif input == "exit"
      exit_screen
    else
      unrecognized_input
    end
  end

  def individual_concert_screen(concert_id)
    separator
    print_bands_for_concert_id(concert_id)
    separator
    print_ticket_price
    separator
    prompt_to_buy_ticket_or_see_all_bands
    separator
    validate_user_choice
  end

  # the terminal then prints out the bands playing at the selected concert
  def print_bands_for_concert_id(user_input)
    puts "#{pastel.bright_cyan('Here are the headliners for this concert:')}"
    puts "                                                      "
    selected_bands = Concert.find(user_input).bands
    selected_bands.each do |band|
      puts band.name
    end
  end

  def print_ticket_price
    puts "Tickets for this concert cost #{pastel.bright_cyan("$#{rand(100...500)}.00.")}"
  end
  # the terminal then prompts the user to purchase a ticket.
  def prompt_to_buy_ticket_or_see_all_bands
    puts "#{pastel.bright_cyan('Please make a selection:')}"
      puts "  "
      puts "#{pastel.bright_cyan('buy')} - buy tickets to this concert."
      puts "#{pastel.bright_cyan('1')} - see the concert list again."
      puts "#{pastel.bright_cyan('2')} - see all top bands in the US."
      puts "#{pastel.bright_cyan('exit')} - to quit the app."
  end

  # the user can choose to buy a ticket, go back, or exit_screen the program.
  def validate_user_choice
    input = gets.chomp
    if input =="exit"
      exit_screen
    elsif input == "buy"
      ticketing_screen
    elsif input.to_i == 1
      concert_screen
    elsif input.to_i == 2
      # if user doesn't want to buy a ticket yet, they can look for other upcoming bands and/or concerts by typing bands.
      bands_screen
    else
      unrecognized_input
    end
  end

  def ticketing_screen
    separator
    puts "Thank you for your purchase."
    puts "Your mobile ticket will arrive soon."
    separator
    exit
  end

  def bands_screen
    separator
    list_all_bands
    separator
    prompt_to_type_band_number
    separator
    validate_band_number_input
  end

  # the terminal then prints out the full band list
  def list_all_bands
    puts "#{pastel.bright_cyan("Here are the top headliners:")}"
    puts "                                                      "
    Band.all.each do |band|
      puts "#{band.id}. #{band.name}"
    end
  end

  # after that, the terminal prompts the user to select their favorite band
  def prompt_to_type_band_number
    puts "Type the band number to their upcoming concerts."
    puts "For example, type #{pastel.bright_cyan("3")} to see Jack White's concerts."
  end

  # user's input is then validated. User can exit_screen or see see list of concerts for their selected band.
  def validate_band_number_input
    input = gets.chomp
    if input.to_i > Band.count
      unrecognized_input
    elsif input.to_i < 0
      unrecognized_input
    elsif input.to_i > 0
      individual_bands_screen(input)
    elsif input == "exit"
      exit_screen
    else
      unrecognized_input
    end
  end

  # Once "bands" input is validated, user is walked through the rest of the program.

  def individual_bands_screen(user_input)
    separator
    list_all_concerts_for_band_id(user_input)
    separator
    prompt_to_buy_ticket_or_see_all_bands
    separator
    validate_user_choice
  end

  # prints out the concerts where the selected band is playing
  def list_all_concerts_for_band_id(user_input)
    puts "That band is playing in these concerts:"
    puts "                                                      "
    selected_concerts = Band.find(user_input).concerts
    selected_concerts.each do |concert|
      puts concert.title
    end
  end

  # this function is called by the run.rb file
  def run
    greet_screen
    exit_screen
  end
end
