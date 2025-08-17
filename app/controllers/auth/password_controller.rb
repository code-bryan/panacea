class Auth::PasswordController < ApplicationController
  def new
    @form = Auth::ForgotPasswordForm.new
  end

  def create
    @form = Auth::ForgotPasswordForm.new(password_params)

    unless @form.valid?
      @form.errors.add(:base, "Something went wrong try again")
      render :new, status: :unprocessable_content
    end

    redirect_to auth_reset_password_path
  end

  def reset; end

  private

  def password_params
    params.require(:auth_forgot_password_form).permit(:email)
  end
end
