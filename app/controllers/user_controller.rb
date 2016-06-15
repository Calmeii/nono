class UserController < ApplicationController
  layout "articles_layout"
  def info
    @user = User.where(:id => params[:user]).first
  end
end
