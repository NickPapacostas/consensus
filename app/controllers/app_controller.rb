class AppController < ApplicationController
  before_filter :require_user
  layout false

  def index
    @user = current_user if current_user
  end
end