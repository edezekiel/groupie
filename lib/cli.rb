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

  # greets the user and provides basic instructions.
  def greet
    separator
    puts "Welcome to #{pastel.bright_cyan('Groupie')}."
    puts "Keep up with your favorite bands, never miss a show!"
    puts "Type #{pastel.bright_cyan('exit')} at any time to quit the app."
    puts "Type #{pastel.bright_cyan('concerts')} to get started."
  end

  # after the greet method ends, the run method asks for user input

  # different methods are called depending on what the user types.

  # if user types "concerts", this this will run.
  def picked_concerts
    separator
    list_all_concerts
    separator
    user_input_concert_id
    separator
    concert_input_choices
  end

  # lists all the top concerts.
  def list_all_concerts
    puts "Here are the top U.S. music concerts:"
    puts "                                                      "
    Concert.all.each_with_index do |concert, index|
      puts "#{index + 1}. #{concert.title}"
    end
  end

  # prompts the user to select their favorite concert.
  def user_input_concert_id
    puts "Type the concert number to see the headlining bands."
    puts "For example, type #{pastel.bright_cyan("2")} to see Electric Zoo's headliners."
  end

  # logic that is applied to user's concert choice.
  def concert_input_choices
    input = gets.chomp
    separator
    if input.to_i > Concert.count
      unrecognized_input
    elsif input.to_i < 0
      unrecognized_input

    # if user makes an accetable concert choice,
    # they are walked through ticket purchase options.
    elsif input.to_i > 0
      print_bands_for_concert_id(input)
      separator
      buy_ticket?
      separator
      purchase_option
      separator
    elsif input == "exit"
      exit
    else
      unrecognized_input
    end
  end

  # prints out the bands playing at the selected concert
  def print_bands_for_concert_id(user_input)
    puts "Here are the headliners for the concert you selected:"
    puts "                                                      "
    selected_bands = Concert.find(user_input).bands
    selected_bands.each do |band|
      puts band.name
    end
  end

  # lets user select whether they want to buy tickets.
  def buy_ticket?
    puts "Tickets for this concert cost $#{rand(100...1000)}.00."
    puts "Would you like to buy a ticket?"
    puts "(#{pastel.bright_cyan('0')} = no, #{pastel.bright_cyan('1')} = yes)."
  end

  # this logic is applied to the user's response to
  # the ticket purchase offer.
  def purchase_option
    input = gets.chomp
    separator
    if input.to_i == 1
      puts "Your mobile ticket will arrive soon."
      exit
    elsif input == "exit"
      exit
    elsif input == "0"
      user_rejects_ticket_offer
    else
      unrecognized_input
    end
  end

  # if user rejects ticket offer, they can look for other
  # upcoming bands and/or concerts.
  def user_rejects_ticket_offer
    puts "Don't see your favorite band? Type #{pastel.bright_cyan('bands')} to see a list"
    puts "of the top 2019 concert headliners."
    puts "Type #{pastel.bright_cyan('exit')} at any time to quit the app."
    separator
    input = gets.chomp
    separator
    if input == "bands"
      picked_bands
    elsif input == "exit"
      exit
    else
      unrecognized_input
    end
  end

  # contains the functions that will run if user picks bands
  def picked_bands
    separator
    list_all_bands
    separator
    user_input_band_id
    separator
    band_input_choices
  end

  # if user picks bands, lists all the bands
  def list_all_bands
    puts "Here are the top headliners:"
    puts "                                                      "
    Band.all.each_with_index do |band, index|
      puts "#{index + 1}. #{band.name}"
    end
  end

  # prompts the user to select their favorite band
  def user_input_band_id
    puts "Type the band number to their upcoming concerts."
    puts "For example, type #{pastel.bright_cyan("3")} to see Jack White's concerts."
  end

  def band_input_choices
    input = gets.chomp
    separator
    if input.to_i > Band.count
      unrecognized_input
    elsif input.to_i < 0
      unrecognized_input
    elsif input.to_i > 0
      print_concerts_for_band_id(input)
      separator
      buy_ticket?
      separator
      purchase_option
    elsif input == "exit"
      exit
    else
      unrecognized_input
    end
  end

  # prints out the concerts where the selected band is playing
  def print_concerts_for_band_id(user_input)
    puts "That band is playing in these concerts:"
    puts "                                                      "
    selected_concerts = Band.find(user_input).concerts
    selected_concerts.each do |concert|
      puts concert.title
    end
  end

  # allows the user to exit the program
  def exit
    puts "Thank you for using #{pastel.bright_cyan('Groupie')}!"
    separator
  end

  # this outputs whenever user types something random
  def unrecognized_input
    puts "Input not recognized or is invalid."
    exit
  end

  # this function is called by the run.rb file
  def run
    greet
    separator
    input = gets.chomp
    if input == "concerts"
      picked_concerts
    elsif input == "exit"
      exit
    else
      unrecognized_input
    end
  end
end
