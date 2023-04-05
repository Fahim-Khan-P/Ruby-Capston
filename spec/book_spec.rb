require_relative '../classes/book'

describe Book do
  context 'Book class tests' do
    before(:each) do
      @book = Book.new('Khan', 'good', '2023/04/12')
    end

    it 'should create an instance fo Book class' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'should have a publisher' do
      expect(@book.publisher).to eq('Khan')
    end

    it 'should have a cover state' do
      expect(@book.cover_state).to eq('good')
    end

    it 'should return false unless @archived || cover_state == bad' do
      expect(@book.can_be_archived?).to eq false
    end
  end
end
