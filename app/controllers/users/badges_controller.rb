class Users::BadgesController < ApplicationController
  def index
    @badges = current_user.badges
  end
end

