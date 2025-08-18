class SupportForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  attribute :message, :string

  validates :name, presence: true
  validates :message, presence: true
  validates :email, presence: true, format: /@/
end
