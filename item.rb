class Item
  attr_accessor :label, :genre, :author, :archived, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..100)
    @publish_date = publish_date
    @archived = false
    @label - label
  end

  def genre=(new_genre)
  @genre = new_genre
  end

  def author=(new_author)
    @author = new_author
  end

  def source=(new_source)
    @source = new_source
  end

  def label=(new_label)
    @label - new_label
  end

  # place for archived methodes
end