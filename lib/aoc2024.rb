require "aoc2024/version"

require "aoc2024/historian_hysteria"
require "aoc2024/red_nosed_reports"

module Aoc2024
  class Error < StandardError; end

  # 30  black
  # 31  red
  # 32  green
  # 33  yellow (brown)
  # 34  blue
  # 35  magenta
  # 36  cyan
  # 37  grey
  # 38  white
  def self.shine thing; "\e[7;38m" + thing.to_s + "\e[m"; end
  # 0   normal
  # 1   bright
  # 2   dim
  # 3   a little less dim
  # 4   underscore
  # 5   blinkenlights
  # 6   just like 3 ?
  # 7   inverse
end

