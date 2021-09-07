boy, girl = 20, 10
boy, girl = boy + 1, girl + 1
ary = Array.new(girl){Array.new(boy){0}}
ary[0][0] = 1
girl.times{|g|
  boy.times{|b|
    if (b != g && boy - b != girl - g) then
      ary[g][b] += ary[g - 1][b] if g > 0
      ary[g][b] += ary[g][b - 1] if b > 0
    end
  }
}
print ary[girl-1][boy-2] + ary[girl-2][boy-1]
