module ApplicationHelper
  def format_phone(phone)
    phone.to_s.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end

  def format_date(str)
    str.to_date.strftime("%d/%m/%Y")
  end
end
