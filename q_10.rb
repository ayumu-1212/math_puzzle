eu_style = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26]
usa_style = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 00, 27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]
eu_max_ar, usa_max_ar = [], []
cnt = 0
(1..35).each do |n|
  eu_ar, usa_ar = [], []
  38.times do |i|
    if -n+i < 0
      eu_ar.push(eu_style[-n+i..-1].sum + eu_style[0..i].sum)
      usa_ar.push(usa_style[-n+i..-1].sum + usa_style[0..i].sum)
    else
      eu_ar.push(eu_style[-n+i..i].sum)
      usa_ar.push(usa_style[-n+i..i].sum)
    end
  end
  eu_max_ar.push(eu_ar.max)
  usa_max_ar.push(usa_ar.max)
  cnt += 1 if eu_max_ar[-1] < usa_max_ar[-1]
end
p eu_max_ar
p usa_max_ar
puts cnt
