class User::SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message(:notice, :greetings, full_name: full_name)
  end
end
