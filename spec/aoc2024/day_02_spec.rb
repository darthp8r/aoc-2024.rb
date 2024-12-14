module Aoc2024
  RSpec.describe RedNosedReports do
    context "Prep Work" do
      describe "Increasing Trends" do
        it "agrees with a normal progression" do
          expect(RedNosedReports.direction([1,2,3,4,5])).to be :increasing
        end

        it "agrees with a flipped progression" do
          expect(RedNosedReports.direction([1,3,2,4,5])).to be :increasing
        end
      end

      describe "Decreasing Trends" do
        it "agrees with a normal progression" do
          expect(RedNosedReports.direction([1,2,3,4,5].reverse)).to be :decreasing
        end

        it "agrees with a flipped progression" do
          expect(RedNosedReports.direction([1,3,2,4,5].reverse)).to be :decreasing
        end
      end

      describe "Undeterminable Trends" do
        it "down-up-down-up is flatlined" do
          expect(RedNosedReports.direction([2,1,4,3,6].reverse)).to be :flatlined
        end

        it "up-up-down-down is flatlined" do
          expect(RedNosedReports.direction([1,2,4,3,2].reverse)).to be :flatlined
        end
      end
    end

    context "Sample" do
      before(:all) do
        @subject = RedNosedReports.new Support.file_to_list __FILE__.gsub('spec.rb', 'sample.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "dunsels" do
        end

        it "sample data agrees" do
          expect(subject.safety_dance.count).to eq 2
        end
      end

      describe "Part 2" do
        it "sample data agrees" do
          expect(subject.within_tolerance.count).to eq 4
        end
      end
    end

    # maybe do the safe? or safe_enough? where safe_enough? knows there's a problem,
    # scoots immediately to the (first) offender, and then runs safe? on the report
    # minus that one element. O(2n)
    #
    context "Fabricated" do
      before(:all) do
        @subject = RedNosedReports.new [
          "1 2 3 8 4",  # SAFE w/o 3
          "1 2 3 4 5",  # SAFE
          "1 2 3 3 4",  # SAFE w/o 3
          "1 1 3 3 5",  # FAIL copied
          "1 2 9 3 5",  # SAFE w/o 2
          "7 5 4 2 1",  # SAFE
        ]
      end
      subject { @subject }

      describe "Part 3/2" do
      # it "dunsels" do
      #   pp subject.reports
      # end

        it "actual answer above" do
          pp subject.within_tolerance.count
        end

        it "results survive" do
          expect(subject.within_tolerance.count).to eq 5
        end
      end
    end

    context "Actual" do
      before(:all) do
        @subject = RedNosedReports.new Support.file_to_list __FILE__.gsub('spec.rb', 'actual.txt')
      end
      subject { @subject }

      describe "Part 1" do
        it "actual answer above" do
          pp subject.safety_dance.count
        end

        it "results survive" do
          expect(subject.safety_dance.count).to eq 356
        end
      end

      describe "Part 2" do
        it "actual answer above" do
          pp subject.within_tolerance.count
        end

        it "results survive" do
          expect(subject.within_tolerance.count).to eq 413
        end
      end
    end
  end
end

