class AppController < ApplicationController
  before_filter :require_user
  layout 'application2'

  def index
    if current_user
      @user = current_user
    else
      redirect_to sign_up_path :layout => 'application'
    end
  end
end