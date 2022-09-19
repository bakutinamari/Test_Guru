class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to sessions_path
    else
      set_greeting
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: 'We out session'
  end

  private

  def set_greeting
    flash[:notice] = "Welcome, #{current_user.name} Guru"
  end
end
