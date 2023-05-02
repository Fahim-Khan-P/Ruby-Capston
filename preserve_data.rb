require 'json'

def store_music_album
  music_album_store = @albums.map do |album|
    {
      publish_date: album.publish_date,
      on_spotify: album.on_spotify,
      name: album.name,
      genre_name: album.genre
    }
  end
  Dir.mkdir('data') unless File.directory?('data')
  File.new('data/music_albums.json', 'w') unless File.exist?('data/music_albums.json')
  File.write('data/music_albums.json', JSON.generate(music_album_store))
end

def load_music_album
  return unless File.exist?('data/music_albums.json')

  albums = JSON.parse(File.read('data/music_albums.json'))
  albums.each do |album|
    album = MusicAlbum.new(album['publish_date'], album['on_spotify'], album['name'], album['genre'])
    @albums << album
  end
end

def store_genre
  genre_store = @genres.map do |genre|
    {
      name: genre.name,
      items: genre.items.map(&:name)
    }
  end
  Dir.mkdir('data') unless File.directory?('data')
  File.new('data/genres.json', 'w') unless File.exist?('data/genres.json')
  File.write('data/genres.json', JSON.generate(genre_store))
end

def load_genre
  return unless File.exist?('data/genres.json')

  genres = JSON.parse(File.read('data/genres.json'))
  genres.each do |genre|
    genre = Genre.new(genre['name'])
    @genres << genre
  end
end
