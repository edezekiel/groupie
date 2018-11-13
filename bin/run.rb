require_relative '../config/environment'
require_relative '../lib/cli.rb'

new_cli = CommandLineInterface.new
new_cli.greet
input = new_cli.gets_user_input
# if user types "Festivals," run display_festivals.
if input == "Festivals"
  new_cli.display_festivals
end


# elsif user types "Headliners, run display_headliners.

# else, display error message
