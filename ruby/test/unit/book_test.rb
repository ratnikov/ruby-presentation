require File.dirname(__FILE__) + '/../test_helper'

class BookTest < Test::Unit::TestCase
  def test_truth
    assert true
  end

  def test_description
    assert_equal "foo by bar", Book.new(:name => "foo", :author => "bar").description, 
      "Description should consist of name and author of the book."
  end

  %w(author name).each do |required_field|
    default_hash = { :name => "foo", :author => "bar" }
    define_method "test_#{required_field}_required" do
      assert_raise(RuntimeError, "Should require #{required_field.inspect}") do
	Book.new default_hash.merge(required_field.to_sym => nil)
      end
    end
  end
end
