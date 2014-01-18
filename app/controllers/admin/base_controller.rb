class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_permission!

  private

  def verify_permission!
    unless current_user.try(:admin?)
      redirect_to root_path, alert: 'You are not authorized.'
    end
  end
end