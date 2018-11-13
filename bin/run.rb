require_relative '../config/environment'
require_relative '../lib/cli.rb'

new_cli = CommandLineInterface.new
new_cli.greet
