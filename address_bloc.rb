require_relative 'controllers/menu_controller'

menu = MenuController.new

#clear the command line
system "clear"
puts "Welcome to AddressBloc!"

menu.main_menu
