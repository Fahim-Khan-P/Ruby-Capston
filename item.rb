class Item
  attr_accessor :label, :genre, :author, :archived, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_label(new_label)
    @label = new_label
    label.add_item(new_label)
  end

  def add_genre(new_genre)
    @genre = new_genre
    genre.add_item(new_genre)
  end

  def add_author(new_author)
    @author = new_author
    author.add_item(new_author)
  end

  # place for method
end