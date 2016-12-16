require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    #display the main menu options
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View Entry Number n"
    puts "6 - Exit"
    print "Enter your selection: "

    #retrieve user input from the command line
    selection = gets.to_i

    case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         create_entry
         main_menu
       when 3
         system "clear"
         search_entries
         main_menu
       when 4
         system "clear"
         read_csv
         main_menu
       when 5
         system "clear"
         view_n_entry
         main_menu
       when 6
         puts "Good-bye!"
         exit(0)#terminate the program
         #0 signals the program is exiting without an error
       else#catch invalid user input
          system "clear"
          puts "Sorry, that is not a valid input"
          main_menu
      end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s

      entry_submenu(entry)
    end
  end

  def entry_submenu(entry)
    #submenu options
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    #chomp removes any trailing whitespace from the string gets returns
    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
     end
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def view_n_entry
    system "clear"
    if address_book.entries.count == 0
      puts "No available entries now"
      return
    end

    print "Enter an entry number [1 - #{address_book.entries.count}]: "

    selection = gets.chomp.to_i

    if selection >= 1 && selection <= address_book.entries.count
      puts address_book.entries[selection - 1].to_s
    else
      puts "#{selection} is not a valid input"
      view_n_entry
    end

  end

end
