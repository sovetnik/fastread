require 'fastread/response'

class EstimatedTimeResponse < Response
  def initialize(time)
    @time = time
    @valid = true
    @answer = true
  end

  def body
    "this article will take #{minutes_counter}"
  end

  private

  def minutes_counter
    @time == 1 ? @time.to_s + ' minute' : @time.to_s + ' minutes'
  end
end
