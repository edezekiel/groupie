class CommandLineInterface

  def pastel
    pastel = Pastel.new
    pastel
  end

  def separator
    puts "                                                      "
    puts pastel.bright_magenta("======================================================")
    puts "                                                      "
  end

  def greet_screen
    welcome_user
    list_first_concert
    list_first_band
    session_screen
  end

  def welcome_user
    separator
    puts "Welcome to #{pastel.bright_cyan('ConcertPlanner')}."
    puts "Use this app to schedule concert sessions!"
  end

  def list_first_concert
    separator
    puts "#{pastel.bright_cyan("Here is the first concert:")}"
    puts Concert.all.first.title
  end

  # the terminal then prints out the full band list
  def list_first_band
    separator
    puts "#{pastel.bright_cyan("Here is the first band:")}"
    puts Band.all.first.name
  end

  def session_screen
    separator
    new_band
  end

  def new_band
    puts "Enter the name for a new band."
    input = gets.chomp
    new_band = Band.create(name: input)
    new_band.concerts.create(:title => "awesome_concert")
  end
  # this function is called by the run.rb file
  def run
    greet_screen
  end
end

# General method that allows the user to exit_screen the program
# def exit_screen
#   puts "Thank you for using #{pastel.bright_cyan('Groupie')}!"
#   separator
#   exit
# end

# General method that outputs whenever user types something random
# def unrecognized_input
#   puts "Input not recognized or is invalid."
#   exit_screen
# end

# def main_menu
#   puts "#{pastel.bright_cyan('Please make a selection:')}"
#     puts "  "
#     puts "#{pastel.bright_cyan('session')} - schedule new band-concert session."
#     puts "#{pastel.bright_cyan('1')} - see all concerts."
#     puts "#{pastel.bright_cyan('2')} - see all bands."
#     puts "#{pastel.bright_cyan('exit')} - to quit the app."
# end

# the user can choose to buy a ticket, go back, or exit_screen the program.
# def validate_user_choice
#   input = gets.chomp
#   if input =="exit"
#     exit_screen
#   elsif input == "buy"
#     ticketing_screen
#   elsif input.to_i == 1
#     concert_screen
#   elsif input.to_i == 2
#     # if user doesn't want to buy a ticket yet, they can look for other upcoming bands and/or concerts by typing bands.
#     bands_screen
#   else
#     unrecognized_input
#   end
# end
