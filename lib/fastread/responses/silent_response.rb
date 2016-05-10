require 'fastread/response'

class SilentResponse < Response
  attr_reader :body

  def initialize
    @body = nil
    @valid = false
    @answer = true
  end
end
