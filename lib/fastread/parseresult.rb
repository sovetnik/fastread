class ParseResult
  def body
    raise 'Must be implemented in child!'
  end

  def answer_to_user?
    raise 'Must be implemented in child!'
  end
end
