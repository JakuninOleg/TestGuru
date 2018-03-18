module ApplicationHelper
  def flash_message(message)
    content_tag :p, flash[message], class: "flash flash-#{message}" if flash[message]
  end
end
