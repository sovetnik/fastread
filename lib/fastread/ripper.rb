require 'open-uri'
require 'readability'

class Ripper
  def initialize(link)
    @link = link
  end

  def extract_article
    content.gsub(/<\/?[^>]+>/, '')
  rescue Exception => e
    # OpenURI::HTTPError
    puts e.message
  end

  private

  def content
    Readability::Document.new(web_page).content
  end

  def web_page
    open(@link, 'User-Agent' => get_user_agent).read
  end

  def get_user_agent
    'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'
  end
end
