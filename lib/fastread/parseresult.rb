class ParseResult
  def body
    raise 'Must be implemented in child!'
  end

  def should_sent?
    raise 'Must be implemented in child!'
  end
end
