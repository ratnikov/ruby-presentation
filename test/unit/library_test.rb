require File.dirname(__FILE__) + '/../test_helper'

class LibraryTest < Test::Unit::TestCase

  def setup
    String.class_eval do
      def description
        self
      end
    end
  end

  def test_truth
    assert true
  end

  def test_catalog
    assert_equal "", Library.new.catalog, "Should return nothing if catalog is empty." 
    assert_equal "foo", Library.new(:items => ["foo"]).catalog, "Should return just \"foo\" if catalog has only one item."
    assert_equal "foo, bar", Library.new(:items => %w(foo bar)).catalog, "Should return items joined by a comma, if more than 1 item."
  end

  def teardown
    String.class_eval do
      remove_method :description
    end
  end
end
