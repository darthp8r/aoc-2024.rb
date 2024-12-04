module Aoc2024
  class Historian

    attr_reader :locations
    attr_reader :x
    attr_reader :y

    def initialize locations=[]
      x, y = locations.inject([[], []]) do |memo, item|
        x, y = item.split
        memo[0].append x.to_i
        memo[1].append y.to_i
        memo
      end
      @x = x.sort
      @y = y.sort
    end

    def distances
      (0...@x.length).inject(0) do |memo, item|
        x, y = @x[item], @y[item]
        if x < y
          memo += y - x
        else
          memo += x - y
        end
      end
    end

    def similarities
      frequencies = @y.inject(Hash.new(0)) do |memo, item|
        memo[item] += 1
        memo
      end

      @x.inject(0) do |memo, item|
        memo + (item * frequencies[item])
      end
    end

  end
end
