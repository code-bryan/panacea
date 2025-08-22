module PatientsHelper
  def get_initials(name)
    name
      .split
      .map { |w| w[0].upcase }
      .join
  end

  def capitalize_name(name)
    name
      .split
      .map { |w| w.capitalize }
      .join(" ")
  end
end
