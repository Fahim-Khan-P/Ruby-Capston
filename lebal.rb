class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, _items)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
