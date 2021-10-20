N = 4

# pattern_n = [0,1].permutation(N)
# pattern_n_1 = [0,1].permutation(N-1)

# [0,1].permutation(N*N-2) do |patterns|
#   maze = []
#   maze += [1]*(N+3) + [0]
#   maze += patterns.shift(N-1)
#   (N-2).times do |i|
#     maze += [1]*2
#     maze += patterns.shift(N)
#   end
#   maze += [1]*2
#   maze += patterns.shift(N-1)
#   maze += [0]
# end
#
INDEX_VECTOR = [N, -1, -N, 1]
def maze(n)
  is_first = true
  indexes = [N*N-1, 0]
  directions = [1, 3]
  while a_index != b_index && (is_first || (a_index != N*N-1 && b_index != 0))
    is_first = false
    2.times do |n|
      [-1, 0, 1].each do |i|
        direction = (direction[n] + i) % 4
      end
    end
  end
end
def is_possible?(n)
end

(2**(N*N-2)).times do |n|
  n <<= 1
  maze(n)
end
