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
    gets.chomp
  end


  def display_festivals

    Concert.all.each do |concert|
      puts concert[:title]

    end

  end

  def headliners
    puts "Eminiem"
    puts "The Killers"
  end

  def run
    greet
    input = gets_user_input
    # if user types "Festivals," run display_festivals.
    if input == "Festivals"
      display_festivals
    end
  end
end
