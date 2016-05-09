require 'fastread/result'

class StandardResult < Result
  attr_accessor :body, :valid, :answer

  def initialize(body, valid: true, answer: true)
    @body = body
    @valid = valid
    @answer = answer
  end

  def valid?
    valid
  end

  def answer?
    answer
  end
end
