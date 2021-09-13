require "pry"
@shoe_hole_num = 12

@max_num = 0
def tieShoe(crossing_num, shoe_holes, is_right)
  remain_holes = [*1..(@shoe_hole_num/2 - 1)] - shoe_holes[is_right ^ 1]
  if remain_holes.empty? && shoe_holes[1].count(0) >= 2
    @max_num = [crossing_num, @max_num].max
  elsif remain_holes.empty? && shoe_holes[1].count(0) < 2
    shoe_holes[0].push(shoe_holes[is_right][-1])
    shoe_holes[1].push(0)
    cnt = 0
    shoe_holes.transpose[0..-2].each do |holes|
      cnt += 1 if (holes[0] - shoe_holes[0][-1]) * (holes[1] - shoe_holes[1][-1]) < 0
    end
    tieShoe(crossing_num + cnt, shoe_holes, is_right ^ 1)
    # 穴を削除
    shoe_holes[0].pop
    shoe_holes[1].pop
  else
    remain_holes.each do |i|
      # 穴を追加
      shoe_holes[is_right].push(shoe_holes[is_right][-1])
      shoe_holes[is_right ^ 1].push(i)
      cnt = 0
      shoe_holes.transpose[0..-2].each do |holes|
        cnt += 1 if (holes[0] - shoe_holes[0][-1]) * (holes[1] - shoe_holes[1][-1]) < 0
      end
      tieShoe(crossing_num + cnt, shoe_holes, is_right ^ 1)
      # 穴を削除
      shoe_holes[0].pop
      shoe_holes[1].pop
    end
  end
end

tieShoe(0, [[0],[0]], 0)
puts @max_num
