require_relative './classes/lebal'
require_relative './classes/book'
require_relative './item'
require_relative './data/preservedata'
require_relative 'game'
require_relative 'author'
require_relative 'genre'
require_relative 'music_album'

class App
  puts 'Welcome to our App!'

  def initialize
    @books = load_data('./data/books.json')
    @labels = load_data('./data/lebal.json')
    @games = load_data('./data/games.json')
    @music_album = load_data('./data/musics.json')
    @authors = load_data('./data/authors.json')
    @genre = load_data('./data/geners.json')
  end

  def list_labels
    @labels = load_data('./data/lebal.json')
    if @labels.empty?
      puts "Sorry, no saved level! \n"
    else
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) Lable Title: #{label['title']} color: #{label['color']}\n"
      end
    end
  end

  def list_books
    @books = load_data('./data/books.json')
    if @books.empty?
      puts 'Sorry!, no saved books \n'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Publish: #{book['publish']}, Cover: #{book['cover']}, Date: #{book['date']}"
      end
    end
  end

  def list_games
    @games = load_data('./data/games.json')
    if @games.empty?
      puts 'Sorry!, no saved games \n'
    else
      @games.each_with_index do |gm, index|
        puts "#{index + 1}) Publish_Date: #{gm['publish_date']}, Multiplayer: #{gm['multiplayer']}, Last_date: #{gm['last_date']}"
      end
    end
  end

  def list_authors
    @authors = load_data('./data/authors.json')
    if @authors.empty?
      puts 'Sorry!, no saved Authors \n'
    else
      @authors.each_with_index do |auth, index|
        puts "#{index + 1}) Firstname: #{auth['first_name']}, Lastname: #{auth['last_name']}"
      end
    end
  end

  def list_all_genres
    @genre = load_data('./data/geners.json')
    if @genre.empty?
      puts 'Sorry!, no saved geners \n'
    else
      @genre.each_with_index do |gen, index|
        puts "#{index + 1}) name: #{gen['name']}"
      end
    end
  end

  def list_all_music_album
    @music_album = load_data('./data/musics.json')
    if @music_album.empty?
      puts 'Sorry!, no saved games \n'
    else
      @music_album.each_with_index do |ms, index|
        puts "#{index + 1}) Music_name: #{ms['name']}, publish_date: #{ms['publish_date']}, on_spotify: #{ms['on_spotify']}"
      end
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

    lebal_data = {
      title: label.title,
      color: label.color
    }
    @labels.push(lebal_data)
    save_data('./data/lebal.json', @labels)
  end

  def add_game
    puts 'Enter publish Date (yyyy-dd-mm):'
    publish_date = gets.chomp
    puts 'Multiplayer:'
    multiplayer = gets.chomp
    puts 'Enter last_played date:'
    last_played_at = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played_at)
    game_data = {
      publish_date: game.publish_date,
      multiplayer: game.multiplayer,
      last_date: game.last_played_at
    }
    @games.push(game_data)
    save_data('./data/games.json', @games)

    puts 'Would you like to add author? (1)- Yes // (2)- No : '
    options = gets.chomp.to_i
    return unless options == 1

    puts 'Input First Name:'
    first_name = gets.chomp
    puts 'Input Last Name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    author_data = {
      first_name: author.first_name,
      last_name: author.last_name
    }
    @authors.push(author_data)
    save_data('./data/authors.json', @authors)
  end

  def add_music_album
    puts 'Music Album Name📛 : '
    name = gets.chomp
    puts 'Music Album publish_date(yyyy-dd-mm) 📅: '
    publish_date = gets.chomp
    puts 'please select on_spotify? : '
    on_spotify = gets.chomp
    music = MusicAlbum.new(name, publish_date, on_spotify)
    music_data = {
      name: music.name,
      publish_date: music.publish_date,
      on_spotify: music.on_spotify
    }
    @music_album << music_data
    save_data('./data/musics.json', @music_album)

    puts 'Would you like to add author? (1)- Yes // (2)- No : '
    options = gets.chomp.to_i
    return unless options == 1

    puts 'Add genre name : '
    name = gets.chomp
    genre = Genre.new(name)
    genre_data = {
      name: genre.name
    }
    @genre << genre_data
    save_data('./data/geners.json', @genre)
    puts 'Your Music Album Added Successfully✅'
  end
end
