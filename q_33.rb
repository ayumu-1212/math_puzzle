require "./q_33_library.rb"
require "pry"

kaminoku = output_kaminoku
simonoku = output_simonoku

def expart(remain_karutas, depth)
  return depth if remain_karutas.size == 0
  next_karutas = []
  remain_karutas.each_with_index do |target_karuta, i|
    next if next_karutas.include?(target_karuta)
    next if i == remain_karutas.size - 1
    is_suffer = false
    remain_karutas[(i+1)..(remain_karutas.size-1)].each do |remain_karuta|
      if target_karuta[0..depth] == remain_karuta[0..depth]
        next_karutas.push(remain_karuta)
        is_suffer = true
      end
    end
    next_karutas.push(target_karuta) if is_suffer
  end
  return expart(next_karutas, depth + 1)
end

puts expart(kaminoku, 0)
puts expart(simonoku, 0)
