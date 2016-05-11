require 'open-uri'
require 'readability'

class Ripper
  def initialize(link)
    @link = link
  end

  def extract_article
    Readability::Document.new(@page).content.gsub(/<\/?[^>]+>/, '') if load_page
  end

  private

  def load_page
    @page ||= begin
      open(@link, 'User-Agent' => get_user_agent).read
    rescue Exception => e
      puts e.message
      false
    end
  end

  def get_user_agent
    'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'
  end
end
