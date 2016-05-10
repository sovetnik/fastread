class Response
  attr_reader :valid, :answer

  def body
    raise 'Must be implemented!'
  end

  def valid?
    valid
  end

  def answer?
    answer
  end
end
