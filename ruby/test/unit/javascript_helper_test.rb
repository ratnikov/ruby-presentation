require File.dirname(__FILE__) + '/../test_helper'

class Foo
  attr_accessor :name
  def name
    @name ||= "foo"
    @name
  end
end

class JascriptHelperTest < Test::Unit::TestCase
  include JavascriptHelper

  def setup
    @foo = Foo.new
  end

  def test_truth
    assert true
  end

  def test_author_js
    assert_equal "var author = constructAuthor(foo)", author_js(@foo)
  end

  def test_book_js
    assert_equal "var book = constructBook(foo)", book_js(@foo)
  end

  def test_author_js_tag
    class << self
      def author_js(author); "<js>#{author}</js>" end
    end
    assert_equal script_tag("<js>foo</js>"), author_js_tag("foo")
  end

  def test_book_js_tag
    class << self
      def book_js(book); "<js>#{book}</js>" end
    end
    assert_equal script_tag("<js>bar</js>"), book_js_tag("bar")
  end

  private

  def script_tag content
    "<script>#{content}</script>"
  end
end
