class SessionsController < ApplicationController
  def new
    @form = Auth::LoginForm.new
  end

  def create
    @form = Auth::LoginForm.new(login_params)

    if not @form.valid?
      @form.errors.add(:base, "Email or password is invalid")
      return render :new, status: :unprocessable_content
    end

    result = Auth::LoginUseCase.call(@form)

    if not result.success?
      @form.errors.add(:base, "Email or password is invalid")
      return render :new, status: :unprocessable_content
    end

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
