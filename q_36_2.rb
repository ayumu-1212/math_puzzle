require "pry"
MAX_NUM = 50
def seven(target, base, nums)
  seki = target * base
  return [[seki]] if seki.to_s.length == seki.to_s.count("0") + seki.to_s.count("7") && nums.size != 9
  return [] if nums.size == 0
  binding.pry
  depth = 9 - nums.size
  this_ar = []
  nums.each do |n|
    next_base = base + (10**depth)*n
    this_seki = target * next_base
    next if this_seki.to_s[-1] == "0"
    if this_seki.to_s[-1*(depth+1)] == "0" || this_seki.to_s[-1*(depth+1)] == "7"
      this_ar += seven(target, next_base, nums - [n])
    end
  end
  return this_ar
end

seven(39, 0, depth)

1.step(MAX_NUM, 2) do |i|
  ar = seven(i, 0, depth)
  is_kaibun = false
  ar.each do |bun|
    is_kaibun = true if bun[0].to_s == bun[0].to_s.reverse
  end
  if is_kaibun
    puts "i=" + i.to_s
    p ar
    puts "~~~~~~~~~~~~~~~~~"
  end
end

