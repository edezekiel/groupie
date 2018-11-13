require_relative '../config/environment'
require_relative '../lib/cli.rb'

new_cli = CommandLineInterface.new
new_cli.run

# elsif user types "Headliners, run display_headliners.

# else, display error message
