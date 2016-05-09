require 'fastread/parseresult'

class StandardResult < ParseResult
  attr_accessor :body

  def initialize(body)
    @body = body
  end

  def answer_to_user?
    true
  end
end
