class CommandLineInterface

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

  # greets the user and asks them to pick a 'concerts' path or 'bands' path
  def greet
    separator
    puts "Welcome to #{pastel.bright_cyan('Groupie')}."
    puts "Keep up with your favorite bands, never miss a show!"
  end

  def basic_prompt
    puts "Type #{pastel.bright_cyan('exit')} at any time to quit the app."
    puts "Type #{pastel.bright_cyan('concerts')} or #{pastel.bright_cyan('bands')} to get started."
    separator
  end

  # if user picks concerts, lists all the concerts
  def list_all_concerts
    puts "Here are the top U.S. music concerts:"
    puts "                                                      "
    Concert.all.each_with_index do |concert, index|
      puts "#{index + 1}. #{concert.title}"
    end
  end

  # prompts the user to select their favorite concert
  def user_input_concert_id
    puts "Type the concert number to see the headlining bands."
    puts "For example, type #{pastel.bright_cyan("2")} to see Electric Zoo's headliners."
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
    puts "Thank you for using our app!"
    separator
  end

  def unrecognized_input
    puts "Input not recognized or is invalid."
  end

  # contains the functions that will run if user picks concerts
  def picked_concerts
    separator
    list_all_concerts
    separator
    user_input_concert_id
    separator
    input = gets.chomp
    separator
    if input.to_i > Concert.count
      unrecognized_input
    elsif input.to_i < 0
      unrecognized_input
    elsif input.to_i > 0
      print_bands_for_concert_id(input)
    elsif input == "exit"
      exit
    else
      unrecognized_input
      exit
    end
  end

  # contains the functions that will run if user picks bands
  def picked_bands
    separator
    list_all_bands
    separator
    user_input_band_id
    separator
    input = gets.chomp
    separator
    if input.to_i > Band.count
      unrecognized_input
    elsif input.to_i < 0
      unrecognized_input
    elsif input.to_i > 0
      print_concerts_for_band_id(input)
    elsif input == "exit"
      exit
    else
      unrecognized_input
      exit
    end
  end

  # this function is called by the run.rb file
  def run
    greet
    basic_prompt

    input = gets.chomp
    if input == "concerts"
      picked_concerts
    elsif input == "bands"
      picked_bands
    elsif input == "exit"
      exit
    else
      unrecognized_input
    end
    separator
    exit
  end
end
