class Auth::LoginUseCase
  include Callable

  def initialize(form)
    @form = form
  end

  def call
    user = User.find_by(email: @form.email)

    return Result.new(data: user, error: nil) if user&.authenticate(@form.password)

    Result.new(data: nil, error: "Invalid email or password")
  end
end
