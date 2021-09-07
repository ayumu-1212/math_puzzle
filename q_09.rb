array = [0,1].repeated_permutation(30).to_a.select{|array| array.sum == 20}
@cnt = 0
array.each do |ar|
  ar_re = ar.reverse
  1.step(19, 2) do |n|
    if ar[0..n].sum == (n+1)/2 || ar_re[0..n].sum == (n+1)/2
      @cnt += 1
      break
    end
  end
end
puts @cnt