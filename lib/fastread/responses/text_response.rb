require 'fastread/response'

class TextResponse < Response
  def initialize(type = :none, name = '')
    @type = type
    @name = name
    @valid = true
    @answer = true
  end

  def body
    self.send(@type)
  end

  private

  def none
    ''
  end

  def start
    <<~START
    Превед, #{@name}!
    Ты можешь послать мне ссылку, а я оценю в минутах, как долго придется читать текст.
    Если ты хочешь сделать то же самое в групповом чате, добавь команду /read перед ссылкой.
    START
  end

  def help
    <<~HELP
    Ты можешь послать мне ссылку, а я оценю в минутах, как долго придется читать текст.
    Если ты хочешь сделать то же самое в групповом чате,
    добавь команду /read и пробел перед ссылкой.
    /who покажет наши имена в телеграм
    /help покажет это сообщение
    HELP
  end

  def who
    '(c) @mistatwista & @sovetnik'
  end
end
