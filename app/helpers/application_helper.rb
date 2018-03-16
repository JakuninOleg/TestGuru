module ApplicationHelper
  def flash_alert(message)
    content_tag :p, flash[:alert] if flash[message]
  end
end
