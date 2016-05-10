require 'fastread/result'

class InvalidResult < Result
  attr_accessor :body, :valid, :answer

  def initialize(body, valid: true, answer: true)
    @body = body
    @valid = valid
    @answer = answer
  end
end
