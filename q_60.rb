H, W = 2, 2

row_bar_max = ("1" * W + "0").to_i(2)
col_bar_max = ("1" * H + "0").to_i(2)
rows = [row_bar_max]
cols = [col_bar_max]
(W-1).times do |w|
  rows.push(0)
end
(H-1).times do |h|
  cols.push(0)
end
rows.push(row_bar_max)
cols.push(col_bar_max)

def add_col_bar(h, w, cols, rows)
end
def add_row_bar(h, w, cols, rows)

end


