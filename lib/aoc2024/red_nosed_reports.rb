module Aoc2024
  class Rednosedreports
    attr_reader :reports

    def initialize reports=[]
      @reports = reports.inject([]) do |memo, item|
        memo.append item.split.map &:to_i
        memo
      end
    end

    # determine increasing or decreasing trend by summing identities for each pair
    #
    def self.direction levels
      where = levels[1..-1].inject([levels[0],0]) do |memo, item|
        previous, accumulator = *memo
        if previous < item
          [item, accumulator+1]
        elsif item < previous
          [item, accumulator-1]
        else
          [item, accumulator]
        end
      end[1]

      if where < 0
        :decreasing
      elsif 0 < where
        :increasing
      else
        :flatlined
      end
    end

    def safety_dance
      @reports.inject([]) do |memo, item|
        memo.append item if safe? item
        memo
      end
    end

    private def safe? levels
      # determine the flow direction
      trend = Rednosedreports.direction levels
      return false if trend == :flatlined

      levels[1..-1].inject(levels[0]) do |memo, item|
        if memo == item
          return false
        elsif 3 < (memo-item).abs
          return false
        elsif not consistent?(trend, memo, item)
          return false
        else
          item
        end
      end
      true
    end

    def within_tolerance
      @reports.inject([]) do |memo, item| 
        if safe? item
          memo.append item
        elsif safe_enough? item
          memo.append item
        else
        end
      # memo.append item if ((safe? item) or (safe_enough? item))
        memo
      end
    end

    # 419 is too high
    # 399 is too low
    private def safe_enough? levels

      # determine the flow direction
      trend = Rednosedreports.direction levels
      return false if trend == :flatlined

      delete_me = offender(trend, levels)
      if delete_me
        safe?(levels[0...delete_me] + levels[1+delete_me..-1]) or
          safe?(levels[0...delete_me-1] + levels[delete_me..-1])
      else
        true
      end
    end

    private def offender(trend, levels)
      (0...(levels.size-1)).each do |index|
        a, b = levels[index], levels[index+1]
        if a == b
          return index+1
        elsif 3 < (a-b).abs
          return index+1
        elsif not consistent?(trend, a, b)
          return index+1
        end
      end
      nil
    end

    private def consistent?(direction, a, b)
      ((direction == :increasing) and (a < b)) or ((direction == :decreasing) and (b < a))
    end

  end
end
