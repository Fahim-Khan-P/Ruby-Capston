class Item
  attr_accessor :genre, :author
  attr_reader :label, :archived, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..100)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  attr_writer :source

  def label=(new_label)
    @label - new_label
  end

  # place for archived methodes
end
