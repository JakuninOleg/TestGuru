class Users::SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message(:notice, :greetings, full_name: current_user.full_name)
  end
end
