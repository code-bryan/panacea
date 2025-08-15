class SessionsController < ApplicationController
  def new
    @form = Auth::LoginForm.new
  end

  def create
    @form = Auth::LoginForm.new(login_params)
    render :new, status: :unprocessable_content and return unless @form.valid?

    result = Auth::LoginUseCase.call(@form)
    render :new, status: :unprocessable_content and return unless result.success?

    session[:user_id] = result.data&.id
    redirect_to root_path, notice: "Logged in!"
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end

  private

  def login_params
    params.require(:auth_login_form).permit(:email, :password)
  end
end
