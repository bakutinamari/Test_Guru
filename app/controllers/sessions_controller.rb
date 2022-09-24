class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to _test_guru_session: 'auhv%2B%2FUaUV%2Fje27gujBeJQZh4UAFGpc9VPt2kAxfk0S5uItgF%2BUm%2BhCdMb9gtiXWqUFwZnNb5T8cA4HI4TsIeh%2FfNGN2K3CZiAXR6ejlwEsek12BxKeIfhmmD8u0mMniELze68ZYLAaa0o8rcTZlc8CvSsDRpFSsyMVdV3ne2M5uo2UcpaX9AJ3vO5lLI21E%2F0wLjdEFRNPMS3J%2ByGmHt1iUaDPs9LkXOmWWLm0rOBmFoBTpZJ%2FYU2YhPC0A%2FVdgIq2jhB5nxqLBv8KBccj2FmLufnhegOVV8jpLECD25OKq%2FcNf46wjvvDCXnZEPR3hi7DNv%2FMQ1BPqopDd%2BfizOe5UkZjtb6TzjyDmDX9KSgNo0iigQ4USwfEqweIGwTSG6aQE7%2BvRFFjERBReyXO0uaW88JF6Yy8b%2FoElxXBW9xdZhWsm%2FyeHmxvpLmkOHTd6n6kXB%2FvHjw3%2FRFcsn6w%3D--n49vRDwZLHJTw7je--FvOnh34ZrurmlK6%2BN9pwmQ%3D%3D'
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: 'We out session'
  end
end
