require_relative '../genre'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a new genre with a name' do
      name = 'Rumba'
      genre = described_class.new(name)
      expect(genre.name).to eq(name)
    end

    it 'generates a random ID between 1 and 1000' do
      name = 'Gospel'
      genre = described_class.new(name)
      expect(genre.instance_variable_get(:@id)).to be_between(1, 1000)
    end

    it 'initializes an empty array for items' do
      name = 'Gengeton'
      genre = described_class.new(name)
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:genre) { described_class.new('Rumba') }

    it "adds the item to the genre's items array" do
      album = instance_double(MusicAlbum, genre: nil)
      genre.add_item(album)
      expect(genre.items).to include(album)
    end

    it "sets the item's genre to the genre object" do
      album = instance_double(MusicAlbum, genre: nil)
      genre.add_item(album)
      expect(album).to have_received(:genre=).with(genre)
    end

    it "doesn't add the same item twice" do
      album = instance_double(MusicAlbum, genre: nil)
      genre.add_item(album)
      genre.add_item(album)
      expect(genre.items.size).to eq(1)
    end
  end
end
