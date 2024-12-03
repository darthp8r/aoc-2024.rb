module Aoc2024
  module Support
    RSpec.describe "file_to_list" do
      subject do
        Support.file_to_list __FILE__.gsub("_spec.rb", ".txt")
      end

      it "three lines" do
        expect(subject.length).to eq 3
      end

      it "separates lines" do
        expect(subject).to eq ["payter", "is a", "hosehead"]
      end
    end
  end
end
