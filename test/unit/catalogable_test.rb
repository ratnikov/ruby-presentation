require File.dirname(__FILE__) + '/../test_helper'

class CatalogableTest < Test::Unit::TestCase
  def test_truth
    assert true
  end

  def test_description
    foo = Class.new do
      include Catalogable
    end.new
    %w(name author).each do |catalogable_attr|
      assert foo.respond_to?(catalogable_attr), "Catalogable should add #{catalogable_attr.inspect} reader."
      assert foo.respond_to?(catalogable_attr+'='), "Catalogable should add #{catalogable_attr.inspect} writer."
    end

    foo.name, foo.author = "Art of War", "Sun Tzu"
    assert_equal "Art of War by Sun Tzu", foo.description, "Should generate correct description."
  end
end
