require_relative '../music_album'

RSpec.describe MusicAlbum do
  describe '#initialize' do
    it 'creates a new music album with a publish date and on_spotify attribute' do
      publish_date = '2023-03-12'
      on_spotify = true
      album = described_class.new(publish_date: publish_date, on_spotify: on_spotify)
      expect(album.publish_date).to eq(publish_date)
      expect(album.on_spotify).to eq(on_spotify)
    end
  end

  describe '#can_be_archived?' do
    context 'when super returns false and @on_spotify is true' do
      it 'returns false' do
        album = described_class.new(publish_date: '2023-03-12', on_spotify: true)
        allow(album).to receive(:super).and_return(false)
        expect(album.can_be_archived?).to be false
      end
    end

    context 'when @on_spotify is false' do
      it 'returns false' do
        album = described_class.new(publish_date: '2023-03-12', on_spotify: false)
        expect(album.can_be_archived?).to be false
      end
    end
  end
end
