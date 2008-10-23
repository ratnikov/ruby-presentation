module Catalogable
  attr_accessor :name, :author
  def description
    "#{name} by #{author}"
  end
end
