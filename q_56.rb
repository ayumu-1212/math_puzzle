M, N = 16, 12

def cut_cake(m, n, cut_length, amount)
  return if @min_cut_length <= cut_length
  if m == 1 && n == 1
    @min_cut_length = cut_length
  else
    (1..m/2).each do |im|
      my_amount = amount + n * im
      other_amount = M * N - m * n - amount
      if my_amount <= @goal_amount && other_amount < @goal_amount
        cut_cake(m - im, n, cut_length + n, other_amount)
        cut_cake(n, m - im, cut_length + n, other_amount)
      end
    end
  end
end

@goal_amount = M * N / 2
@min_cut_length = M * (N - 1) + (M - 1) * N

if M * N % 2 == 0
  cut_cake(M, N, 0, 0)
  puts @min_cut_length
else
  puts "同じ量食べるのはそもそも無理です。"
end
