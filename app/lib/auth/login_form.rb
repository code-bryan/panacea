class Auth::LoginForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_reader :user

  attribute :email, :string
  attribute :password, :string
  attribute :remember_me, :boolean, default: false

  validates :email, presence: true, format: /@/
  validates :password, length: { minimum: 6 }
end
