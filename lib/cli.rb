# the run.rb file creates a new instance of this class, then it calls the
# run method on that instance. The run method then calls on other instance
# methods in the class, in order to walk the user through our program.

class CommandLineInterface

  # this adds style to the code
  def pastel
    pastel = Pastel.new
    pastel
  end

  # this adds a separator between steps of the code
  def separator
    puts "                                                      "
    puts pastel.bright_magenta("======================================================")
    puts "                                                      "
  end

  # this method greets the user and prompts them to get started by entering "concerts."
  def greet
    separator
    puts "Welcome to #{pastel.bright_cyan('Groupie')}."
    puts "Keep up with your favorite bands, never miss a show!"
    puts "Type #{pastel.bright_cyan('concerts')} to get started."
    separator
  end

  ## run method calls on gets.chomp to get user input

  # if user types "concerts", this displays all the concerts.
  def display_concerts
    puts "Here are the top U.S. music concerts:"
    puts "                                                      "
    Concert.all.each do |concert|
      puts "#{concert.id}. #{concert.title}"
    end
    separator
  end

  # promts the user to enter a concert number so they can that concert's bands.
  def ask_for_concert_no
    puts "Type the concert number to see the bands. For "
    puts "example, type #{pastel.bright_cyan("2")} to see Electric Zoo's bands."
    separator
  end

  ## run method calls on gets.chomp to get user input.

  # displays the bands for the concert that the user selected.
  def display_bands(user_input)
    puts "Here are the Bands:"
    selected_bands = Concert.find(user_input).bands.sort
    selected_bands.each do |band|
      puts "#{band.id}. #{band.name}"
    end
    separator
 end

 # asks user to select their favorite band.
 def ask_for_favorite_band
   puts "Type the #{pastel.bright_cyan("number")} of your favorite band to see their upcoming concerts."
   separator
 end

 def display_concerts_for_fav_band(user_input)
    puts "Here are their upcoming concerts:"
    selected_concerts = Band.find(user_input).concerts.sort
    selected_concerts.each do |concert|
      puts "#{concert.id}. #{concert.title}"
    end
    separator
 end

 def exit
    puts "Thank you for using our app!"
    separator
  end

  def run
    # greet the user and ask them to type concerts to get started.
    greet
    # get user's input.
    input = gets.chomp
    separator
    # if user typed "concerts," then the program keeps going.
    if input == "concerts"
      display_concerts
      ask_for_concert_no
      input = gets.chomp
      separator
      display_bands(input)
      ask_for_favorite_band
      input = gets.chomp
      separator
      display_concerts_for_fav_band(input)
      # if user typed "exit," then they exit the program.
    else
      exit
    end
  end
end
