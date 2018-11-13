class CommandLineInterface

  def greet
    puts "======================================================"
    puts "Welcome to Headliners."
    puts "Type 'exit' at any time to quit the app."
    puts "Type 'Festivals' or 'Headliners' for more information."
    puts "======================================================"
  end

  def gets_user_input
    gets.chomp
  end

  def festivals
    puts "1. Coachelle"
    puts "2. Electric Zoo"
  end

  def headliners
    puts "Eminiem"
    puts "The Killers"
  end
end
