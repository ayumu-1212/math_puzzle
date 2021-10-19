require "date"
require "pry"

FIRST_YEAR = 2006
LAST_YEAR = 2015

@max_sum = 0

holidays = []

File.open("sample/q63.txt"){|f|
  row = f.gets
  while !row.nil?
    row_date = Date.parse(row)
    holidays.push([row_date.year, row_date.month, row_date.day])
    row = f.gets
  end
}

this_wday = Date.new(FIRST_YEAR, 1, 1).wday
this_week = Array.new(this_wday, 1)
FIRST_YEAR.upto(LAST_YEAR) do |year|
  [*1..12].each do |month|
    month_array = []
    last_day = Date.new(year, month, -1).day
    [*1..last_day].each do |day|
      if holidays.size > 0 && year == holidays[0][0] && month == holidays[0][1] && day == holidays[0][2]
        this_week.push(1)
        this_wday += 1
        holidays.shift
      elsif this_wday == 0 || this_wday == 6
        this_week.push(1)
        this_wday += 1
      else
        this_week.push(0)
        this_wday += 1
      end
      if day == last_day || this_wday == 7
        this_week += [1] * (7 - this_wday)
        month_array.push(this_week)
        this_wday %= 7
        this_week = Array.new(this_wday, 1)
      end
    end
    max_area = 0
    month_array.each_with_index do |week, weekth|
      zero_first = zero_last = week.index(0)
      if !zero_first.nil?
        week[(zero_first + 1)..-1].each_with_index do |day, n|
          if day == 1
            col = 1
            (weekth - 1).downto(0) do |wkth|
              col += 1 if month_array[wkth][zero_first..zero_last].index(1).nil?
            end
            (weekth + 1).upto(0) do |wkth|
              col += 1 if month_array[wkth][zero_first..zero_last].index(1).nil?
            end
            max_area = [max_area, col * (zero_last - zero_first + 1)].max
            zero_first = zero_last + 1
          end
          zero_last += 1
        end
      end
    end
    @max_sum += max_area
  end
end

puts @max_sum
