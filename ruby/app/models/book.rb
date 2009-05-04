
class Book
  attr_accessor :name, :author, :isbn

  def description
    "#{name} by #{author}"
  end

  def initialize options = {}
    self.name = options.delete(:name) or raise("Must provide name")
    self.author = options.delete(:author) or raise("Must provide author")
    self.isbn = options.delete(:isbn)
  end
end
