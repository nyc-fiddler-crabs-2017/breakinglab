class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if !logged_in?
      redirect_to '/login'
    elsif @user != current_user
      render '404'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to "/",:notice => "signed up"
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :access)
  end

end
