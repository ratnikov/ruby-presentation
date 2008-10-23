
class Library
  attr_accessor :items

  def initialize options = {}
    self.items = options.delete(:items) || []
  end

  def catalog
    items.map { |i| i.description }.join ", "
  end
end
