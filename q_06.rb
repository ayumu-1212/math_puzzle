@count = 0
(1..10000).each do |n|
  if n.modulo(2) == 1
    next
  else
    target = n*3 + 1
    ar = []
    while !ar.include?(target)
      if target == n
        @count += 1
        puts n
        break
      else
        ar.push(target)
      end
      if target.modulo(2) == 1
        target = target*3 + 1
      else
        target = target / 2
      end
    end
  end
end
puts "～～～～～～"
puts(@count)