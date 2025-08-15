class Result
  attr_reader :data, :error

  def initialize(data = nil, error)
    @data = data
    @error = error
  end

  def success?
    not @data.nil?
  end
end
