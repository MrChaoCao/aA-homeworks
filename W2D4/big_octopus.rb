class BigO
  fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  def sluggish_octopus
    fish_hash = Hash.new{ |h,k| h[k] = [] }
    fishies.each do |fi|
      fishies.each do |fi2|
        next if fi == fi2
        if fi2.length > fi.length
          fish_hash[fi] += 1
        else
          fish_hash[fi2] = 0
        end
      end
    end
    fish_hash.select { |k, v| v == 0}
  end

  def dominant_octopus
    fishies.merge_sort.last
  end

  def clever_octopus
    biggest = fishies[0]
    fishies.each do |fish|
      if biggest.length < fish.length
        biggest = fish
      end
    end
    biggest
  end

  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  def slow_dance(tile, tiles_array)
    tiles_array.each_with_index do |til, idx|
      return idx if til == tile
    end
  end

  def constant_dance(tile)
    tiles_array[tile]
  end

end

class Array
  def merge_sort(&prc)
    prc ||= proc { |a, b| a <=> b }
    return self if self.length < 2

    mid = self.length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) < 0
        merged << left.shift
      else
        merged << right.shift
      end
    end

    merged + left + right
  end
end
