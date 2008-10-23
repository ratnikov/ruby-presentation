module JavascriptHelper
  def author_js author
    "var author = constructAuthor(#{author.name})"
  end

  def book_js book
    "var book = constructBook(#{book.name})"
  end

  def author_js_tag author
    script_tag author_js(author)
  end

  def book_js_tag book
    script_tag book_js(book)
  end
end
