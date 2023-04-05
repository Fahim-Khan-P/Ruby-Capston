require_relative './app'

def main
  app = App.new
  res = nil
  puts "Welcome Catalog App!\n\n"
  while res != '10'
    puts "Please choose an option by enter in a number from 1 to 10:\n\n"
    puts '1 - List all books'
    puts '2 - List all lables'
    puts '3 - Add a book'
    puts '4 - Add a game'
    puts '5 - List all games'
    puts '6 - List all authors'
    puts '7 - List of all Genre'
    puts '8 - Add music Album '
    puts '9 - List of all Music Album'
    puts '10 - Exit App \n'

    res = gets.chomp
    case res
    when '1'
      app.list_books
    when '2'
      app.list_labels
    when '3'
      app.add_book
    else
      puts 'Thank you'
    end
  end
end

main
