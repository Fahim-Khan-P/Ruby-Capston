require_relative '../classes/lebal'
require_relative '../classes/book'

describe Label do
  context 'Testing the Label class'
  lable = Label.new('Ruby', 'red')

  it 'should create an instance of Label class' do
    label = Label.new('label', 'red')
    expect(label).to be_an_instance_of(Label)
  end

  it 'should validate the title of the lable' do
    expect(lable.title).to eq('Ruby')
  end

  it 'should validate the color of the lable' do
    expect(lable.color).to eq('red')
  end

  it 'should add item peoperly' do
    publisher = 'John'
    cover_state = 'good'
    publish_date = '02/02/03'

    book = Book.new(publisher, cover_state, publish_date)
    lable = Label.new('Ruby', 'red')
    lable.add_item(book)
    expect(lable.items.length).to eq 1
  end
end
