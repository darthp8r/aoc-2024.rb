module Aoc2024
  class Rednosedreports
    attr_reader :reports

    def initialize reports=[]
      @reports = reports.inject([]) do |memo, item|
        memo.append item.split.map &:to_i
        memo
      end
    end

    def safety_dance
      @reports.inject(0) do |memo, item|
        if safe? item
          memo + 1
        else
          memo
        end
      end
    end

    private def safe? dancers
      # determine the flow direction
    # pp dancers
      if dancers[0] < dancers[1]
      # pp ""
      # pp "SET INCREASING"
        trend = :increasing
      elsif dancers[1] < dancers[0]
      # pp ""
      # pp "SET DECREASING"
        trend = :decreasing
      else
        return false
      end

      dancers[1..-1].inject(dancers[0]) do |a, b|
      # pp "compare #{a} with #{b}"
        if a == b
      #   pp "EQUALS #{b}"
          return false
        elsif 3 < (a-b).abs
      #   pp "DIVERGENT #{a} #{b}"
          return false
        elsif (trend == :increasing) and (a < b)
          b
        elsif (trend == :decreasing) and (b < a)
          b
        else
      #   pp "CHANGED DIRECTIONS #{a} #{b}"
          return false
        end
      end
    # pp "SAFE!"
      true
    end

  end
end
