@count = 0
@basic_vector = [[0,1], [1,0], [0,-1], [-1,0]]
def clean_robbot(times, record_array = [[0, 0]])
  if record_array.count != record_array.uniq.count
  elsif times == 0
    @count += 1
  else
    @basic_vector.each do |basic_vector|
      next_vector = [record_array.last[0] + basic_vector[0], record_array.last[1] + basic_vector[1]]
      next_record_array = record_array.clone
      next_record_array.push(next_vector)
      clean_robbot(times - 1, next_record_array)
    end
  end
end

clean_robbot(12)
puts @count