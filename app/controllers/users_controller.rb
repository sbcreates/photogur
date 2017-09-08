class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.email = params[:user][:email]
    @user.password_digest = params[:user][:password]

    if @user.save
      redirect_to root_url
    end
  end
end