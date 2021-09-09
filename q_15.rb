require "pry"
@step_pattern = [1,2,3,4]
def stairs(num)
  step_count = 0
  steps = Array.new(num+1){Array.new(num/2){0}}
  steps_A = Array.new(num+1){Array.new(num/2){0}}
  steps_A.each_with_index do |step_a, stair_num|
    (num/2).times do |n|
      if (stair_num.to_f / (n + 1)).ceil > 4 || (stair_num / (n + 1)) == 0
        steps_A[stair_num][n] = 0
      else
        steps_A[stair_num][n] = @step_pattern.repeated_permutation(n+1).to_a.select{|ar| ar.sum == stair_num }.size
      end
    end
  end
  steps_B = steps_A.dup
  steps_B.reverse!
  steps.each_with_index do |step, i|
    step.size.times do |t|
      steps[i][t] = steps_A[i][t] * steps_B[i][t]
      step_count += steps[i][t]
    end
  end
  return step_count
end

puts stairs(100)


