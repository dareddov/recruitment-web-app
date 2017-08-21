class Admin::BaseController < ApplicationController
  before_action :authorize_admin!

  private

  def authorize_admin!
    redirect_to root_path, alert: t('common.access_denied') unless current_user.is_admin?
  end
end
