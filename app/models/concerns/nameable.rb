module Nameable
  extend ActiveSupport::Concern

  def full_name
    [ first_name, last_name ].compact.join(" ").strip
  end
end
