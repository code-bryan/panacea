class SupportController < ApplicationController
  def index
    @form = SupportForm.new
  end

  def create
    @form = SupportForm.new(support_params)
    render :index, status: :unprocessable_content and return unless @form.valid?

    redirect_to support_index_url, notice: "Thank you for reaching out! Our support team will get back to you within 24 hours."
  end

  private

  def support_params
    params.require(:support_form).permit(:name, :email, :message)
  end
end
