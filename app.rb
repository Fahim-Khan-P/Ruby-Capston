require_relative './classes/lebal'
require_relative './classes/book'
require_relative './item'
require_relative './data/preservedata'

class App
  puts 'Welcome to our App!'

  def initialize
    @books = load_data('./data/books.json')
    @labels = load_data('./data/lebal.json')
  end

  def list_books
    if @books.empty?
      puts 'Sorry!, no saved books \n'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Publish: #{book['publish']}, Cover: #{book['cover']}, Date: #{book['date']}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts "Sorry, no saved level! \n"
    else
      @labels.each { |label| puts "Lable Title:#{label.title} color:#{label.color}\n" }
    end
  end

  def add_book
    puts 'Enter Publisher:'
    publish = gets.chomp
    puts 'Enter Cover State:'
    cover = gets.chomp
    puts 'Enter publish Date:'
    date = gets.chomp
    book = Book.new(publish, cover, date)
    book_data = {
      publish: book.publisher,
      cover: book.cover_state,
      date: book.publish_date
    }

    @books.push(book_data)
    save_data('./data/books.json', @books)
    puts 'Would you like to add label press (1):'
    option = gets.chomp.to_i
    return unless option == 1

    puts 'Enter label\'s Title:'
    title = gets.chomp
    puts 'Enter label\'s color:'
    color = gets.chomp
    label = Label.new(title, color)
    @labels.push(label)
  end
end
