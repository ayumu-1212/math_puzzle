require "pry"
require "prime"

N = 3
# 100~1000の素数
primes = Prime.lazy.drop_while {|p| p < 10**(N-1) }.take_while{|p| p < 10**N }.to_a.map(&:to_s)

@memo = []

primes.each do |first_col_prime|
  next if first_col_prime.include?("0")
  primes.each do |first_row_prime|
    next if first_row_prime[0] != first_col_prime[0]
    next if first_row_prime.include?("0")
    primes.each do |second_col_prime|
      next if second_col_prime[0] != first_row_prime[1]
      primes.each do |second_row_prime|
        next if second_row_prime[0] != first_col_prime[1]
        next if second_row_prime[1] != second_col_prime[1]
        primes.each do |third_col_prime|
          next if third_col_prime[0] != first_row_prime[2]
          next if third_col_prime[1] != second_row_prime[2]
          primes.each do |third_row_prime|
            next if third_row_prime[0] != first_col_prime[2]
            next if third_row_prime[1] != second_col_prime[2]
            next if third_row_prime[2] != third_col_prime[2]
            next if [first_col_prime, second_col_prime, third_col_prime, first_row_prime, second_row_prime, third_row_prime].uniq.size < 6
            @memo.push([[first_col_prime, second_col_prime, third_col_prime],[first_row_prime, second_row_prime, third_row_prime]])
          end
        end
      end
    end
  end
end
puts @memo.size
