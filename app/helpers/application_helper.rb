module ApplicationHelper
 ALERTS  = { alert: 'danger',
             notice: 'primary' }.freeze

  def alert_value(key)
    ALERTS[key.to_sym]
  end
end
