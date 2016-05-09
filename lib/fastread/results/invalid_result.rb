require 'fastread/result'

class InvalidResult < Result
  attr_accessor :body, :valid, :answer

  def initialize(body, valid: false, answer: true)
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
