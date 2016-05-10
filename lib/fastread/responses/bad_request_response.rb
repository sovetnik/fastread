require 'fastread/response'

class BadRequestResponse < Response
  def initialize(message = "")
    @message = message
    @valid = false
    @answer = true
  end

  def body
    "Bad request" + message
  end

  def message
    ": " + @message unless @message.empty?
  end
end
