class CommandLineInterface

  def pastel
    pastel = Pastel.new
    pastel
  end

  def separator
    pastel
    puts "                                                      "
    puts pastel.bright_magenta("======================================================")
    puts "                                                      "
  end

  def greet
    pastel
    separator
    puts "Welcome to #{pastel.bright_cyan('Groupie')}."
    puts "                                                      "
    puts "Keep up with your favorite bands, never miss a show!"
    puts "Type #{pastel.bright_cyan('exit')} at any time to quit the app."
  end

  def gets_user_input
    gets.chomp

  end

  def display_festivals
    pastel
    separator
    puts "Here are the top U.S. music festivals:"
    puts "                                                      "
    Concert.all.each do |concert|
      puts "#{concert.id}. #{concert.title}"
    end
    separator
    puts "Type the festival number to see the headliners. For "
    puts "example, type #{pastel.bright_cyan("2")} to see Electric Zoo's headliners."

  end

  def headliners
    pastel
    separator
    input = gets_user_input
    puts "Here are the Headliners:"
    selected_bands = Concert.find(input).bands

    selected_bands.each do |band|
      puts band.name
    end
      # puts "#{index + 1}. #{band.name}"
    #displays the Headliners for concerts
    # puts "Eminiem"
    # puts "The Killers"
    input = gets_user_input
    binding.pry


  end



  def exit
    puts "Thank you for using our app!"
  end

  def run
    greet
    puts "Type #{pastel.bright_cyan('Festivals')} or #{pastel.bright_cyan('Headliners')} for more information."
    puts "  "
    # input = gets_user_input
    # if user types "Festivals," run display_festivals.
    input = gets_user_input

    if input == "exit"
      exit
    elsif input == "Festivals"
      display_festivals
      headliners
    end
    separator
  end
end
