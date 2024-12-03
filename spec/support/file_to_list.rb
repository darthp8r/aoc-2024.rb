module Aoc2024
  module Support
    def self.file_to_list filename
      File.open filename do |me|
        me.readlines chomp: true
      end.reject(&:empty?)
    end
  end
end

