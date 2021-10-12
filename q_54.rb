N = 11


def search(order, remain_cards)
  return 1 if remain_cards.empty?
  empty_index = order.index(0)
  count = 0
  remain_cards.each do |card_num|
    if order[empty_index + card_num + 1] == 0
      order[empty_index] = card_num
      order[empty_index + card_num + 1] = card_num
      count += search(order, remain_cards - [card_num])
      order[empty_index] = 0
      order[empty_index + card_num + 1] = 0
    end
  end
  return count
end

first_order = Array.new(N*2, 0)

puts search(first_order, [*1..N])
