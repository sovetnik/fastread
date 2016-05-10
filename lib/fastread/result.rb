class Result
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
