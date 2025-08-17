class Auth::ForgotPasswordForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :email, :string

  validates :email, presence: true, format: /@/
end
