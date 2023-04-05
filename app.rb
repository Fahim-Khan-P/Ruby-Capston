require_relative './classes/lebal'
require_relative './classes/book'
require_relative './item'

class App
  puts 'Welcome to our App!'

  def initialize
    @books = []
    @labels = []
  end

  def add_book
    puts 'Enter Publisher:'
    publish = gets.chomp
    puts 'Enter Cover State:'
    cover = gets.chomp
    puts 'Enter publish Date:'
    date = gets.chomp
    book = Book.new(publish, cover, date)
    @books.push(book)
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

  def list_books
    if @books.empty?
      puts 'Sorry!, no saved books \n'
    else
      @books.each do |book|
        puts "Publisher:#{book.publisher} Cover State: #{book.cover_state} Publish Date: #{book.publish_date} \n"
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
end
