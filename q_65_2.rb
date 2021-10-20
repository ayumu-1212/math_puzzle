require "pry"
P = 10

first_people = []
P.times do |p|
  first_people.push(p)
end
first_people[-1] = nil

@goal_people = first_people.clone
@goal_people[0], @goal_people[-1] = @goal_people[-1], @goal_people[0]

def catch_ball(catch_side, people, depth)
  return if depth >= @min
  return if @memo.has_key?(people) && @memo[people] <= depth
  @memo[people.clone] = depth
  if people == @goal_people
    @min = [@min, depth].min
    return
  end
  catcher_index = people[(catch_side * P / 2)..((catch_side+1) * P / 2 - 1)].index(nil)
  [*-1..1].each do |i|
    pitcher_index = catcher_index + i
    if pitcher_index >= 0 && pitcher_index < P/2
      people[(catch_side * P / 2) + catcher_index], people[((catch_side-1) * P / 2) + pitcher_index] =  people[((catch_side-1) * P / 2) + pitcher_index], people[(catch_side * P / 2) + catcher_index]
      catch_ball((catch_side+1) % 2, people, depth + 1)
      people[(catch_side * P / 2) + catcher_index], people[((catch_side-1) * P / 2) + pitcher_index] =  people[((catch_side-1) * P / 2) + pitcher_index], people[(catch_side * P / 2) + catcher_index]
    end
  end
end

@min = 1000

@memo = {}
catch_ball(1, first_people, 0)
puts @memo.size
puts @min
