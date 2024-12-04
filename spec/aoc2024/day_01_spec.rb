module Aoc2024
  RSpec.describe Historian do
    context "Sample" do
      before(:all) do
        @subject = Historian.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "first column has six elements" do
          expect(subject.x.length).to eq 6
        end

        it "second column has six elements" do
          expect(subject.y.length).to eq 6
        end

        it "distances equal 11" do
          expect(subject.distances).to eq 11
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.similarities).to eq 31
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = Historian.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.distances
        end

        it "results survive" do
          expect(subject.distances).to eq 2285373
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.similarities
        end

        it "results survive" do
          expect(subject.similarities).to eq 21142653
        end
      end
    end
  end
end

