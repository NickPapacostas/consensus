class AppController < ApplicationController
  before_filter :require_user
  layout 'app/application'

  def index
    if current_user
      @user = current_user
    else
      flash[:error] = "Sign in to chat"
      respond_to do |format|
        format.html{redirect_to root_url}
      end
    end
  end
end