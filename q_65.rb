require "pry"
P = 8

first_people = [[],[]]
P.times do |p|
  first_people[2*p/P].push(p)
end
first_people[1][-1] = nil

@goal_people = Marshal.load(Marshal.dump(first_people))
@goal_people[0][0], @goal_people[-1][-1] = @goal_people[-1][-1], @goal_people[0][0]

def catch_ball(catch_side, people, depth)
  return if depth >= @min
  return if @memo.has_key?(people) && @memo[people] <= depth
  @memo[Marshal.load(Marshal.dump(people))] = depth
  if people == @goal_people
    @min = [@min, depth].min
    return
  end
  catcher_index = people[catch_side].index(nil)
  [*-1..1].each do |i|
    pitcher_index = catcher_index + i
    if pitcher_index >= 0 && pitcher_index < P/2
      people[catch_side][catcher_index], people[catch_side-1][pitcher_index] = people[catch_side-1][pitcher_index], people[catch_side][catcher_index]
      catch_ball((catch_side+1) % 2, people, depth + 1)
      people[catch_side][catcher_index], people[catch_side-1][pitcher_index] = people[catch_side-1][pitcher_index], people[catch_side][catcher_index]
    end
  end
end

@min = 1000

@memo = {}
catch_ball(1, first_people, 0)
puts @min
