require "pry"
clubs = [[11000, 40], [8000, 30], [400, 24], [800, 20], [900, 14],
        [1800, 16], [1000, 15], [7000,40], [100, 10], [300, 12]]
MAX_MEMBERS = 150

def select(remain_clubs, members_num, area)
  finish = true
  remain_clubs.each_with_index do |club, i|
    if members_num + club[1] <= MAX_MEMBERS
      select(remain_clubs[i..-1] - [club], members_num + club[1], area + club[0])
      finish = false
    end
  end
  @max = [@max, area].max if finish
end
@max = 0
select(clubs, 0, 0)
puts @max
