require "date"
(Date.new(1964, 10, 10)..Date.new(2020, 7, 24)).each do |date|
  date_t = date.strftime("%Y%m%d")
  date_r = Integer(date_t).to_s(2).reverse.to_i(2).to_s
  if date_t == date_r
    puts date_t
  end
end
