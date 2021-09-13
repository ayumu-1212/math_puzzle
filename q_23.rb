first_coins_num = 10
@game_count = 24

def blackJack(now_count, now_coins_num)
  if now_coins_num <= 0
    return 0
  elsif now_count >= @game_count
    return 1
  else
    return blackJack(now_count + 1, now_coins_num - 1) + blackJack(now_count + 1, now_coins_num + 1)
  end
end

puts blackJack(0, first_coins_num)
