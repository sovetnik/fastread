require 'fastread/result'
require 'fastread/ripper'
require 'fastread/text_analizer'

class StandardResult < Result
  attr_accessor :url, :valid, :answer

  def initialize(url, valid: true, answer: true)
    @url = url
    @valid = valid
    @answer = answer
  end

  def body
    "this link will take #{reading_time} minutes"
  end

  def article
    Ripper.new(url).extract_article
  end

  def reading_time
    TextAnalizer.time_for_text(article, :average)
  end
end
