class Admin::BaseController < ApplicationController
  before_action :admin_required!

  def admin_required!
    redirect_to root_path, alert: 'Вы не админ' unless current_user.is_a?(Admin)
  end

  def after_sign_in_path_for(admin)
    admin_tests_path
  end
end
