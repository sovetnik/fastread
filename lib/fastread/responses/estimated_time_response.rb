require 'fastread/response'

class EstimatedTimeResponse < Response
  def initialize(time)
    @time = time
    @valid = true
    @answer = true
  end

  def body
    "this will take #{minutes_counter}"
  end

  private

  def minutes_counter
    @time > 1 ? @time.to_s + " minutes" : @time.to_s + " minute"
  end
end
