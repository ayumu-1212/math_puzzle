W = 6
H = 5

def make_pazzle(arrangement, depth)
  if depth >= W * H
    @pazzles.push(arrangement)
  else
    h = depth / W
    w = depth % W
    if (h == 0 || (arrangement & 1<<(W - 1)) == 0) && (w == 0 || (arrangement & 1) == 0)
      make_pazzle(arrangement << 1 | 1, depth + 1)
    end
    make_pazzle(arrangement << 1, depth + 1)
  end
end

def test_pazzle(address)
  h = address / W
  w = address % W
  if w > 0 && (@pazzle & 1 << (address - 1) == 0)
    @pazzle |= 1 << (address - 1)
    test_pazzle(address - 1)
  end
  if w < (W-1) && (@pazzle & 1 << (address + 1) == 0)
    @pazzle |= 1 << (address + 1)
    test_pazzle(address + 1)
  end
  if h < (H-1) && (@pazzle & 1 << (address + W) == 0)
    @pazzle |= 1 << (address + W)
    test_pazzle(address + W)
  end
  if h > 0 && (@pazzle & 1 << (address - W) == 0)
    @pazzle |= 1 << (address - W)
    test_pazzle(address - W)
  end
end

@pazzles = []

make_pazzle(0,0)

count = 0
@pazzles.each do |pazzle|
  @pazzle = pazzle
  if pazzle % 2 == 0
    test_pazzle(0)
  else
    test_pazzle(1)
  end
  if @pazzle == ((1 << (W * H)) - 1)
    count += 1
  end
end

puts count
