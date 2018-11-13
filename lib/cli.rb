class CommandLineInterface

  def greet
    puts "======================================================"
    puts "Welcome to Headliners."
    puts "Keep up with your favorite bands, never miss a show!"
    puts "Type 'exit' at any time to quit the app."
    puts "======================================================"
  end

  def gets_user_input
    puts "Type 'Festivals' or 'Headliners' for more information."
    response = gets.chomp
  end


  def display_festivals
    puts "1. Coachelle"
    puts "2. Electric Zoo"
    binding.pry
  end

  def headliners
    puts "Eminiem"
    puts "The Killers"
  end
end
