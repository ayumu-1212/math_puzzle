require "pry"
@ip_candidate = []
(0..255).each do |s|
  @ip_candidate.push([s.to_s.chars, sprintf("%08b", s).reverse.to_i(2).to_s.chars])
end

count = 0
(0..254).each do |s|
  (s..255).each do |t|
    ar = @ip_candidate[s][0] + @ip_candidate[s][1] + @ip_candidate[t][0] + @ip_candidate[t][1]
    if ar.size == 10 && ar.uniq.size == 10
      count += 2
      puts @ip_candidate[s][0].inject(:+) + "." + @ip_candidate[s][1].inject(:+) + "." + @ip_candidate[t][0].inject(:+) + "." + @ip_candidate[t][1].inject(:+)
    end
  end
end

puts count
