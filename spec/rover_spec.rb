require "rover"

RSpec.describe Rover, "#navigate" do
  let(:rover) { Rover.new(x, y, maxX, maxY, orientation, instructions) }
  let(:x) { 0 }
  let(:y) { 0 }
  let(:maxX) { 10 }
  let(:maxY) { 10 }
  let(:orientation) { "N" }
  let(:instructions) { "M M R M M R M R R M" }

  context "when the rover is at (0,0,N)" do
    it "expects rover to move until point" do
      rover.navigate

      expect(rover.position).to eq("2 2 N")
    end
  end

  context "when the rover is at (1,2,N) with new instructions" do
    let(:x) { 1 }
    let(:y) { 2 }
    let(:instructions) { "L M L M L M L M M" }

    it "expects rover to move until point" do
      rover.navigate

      expect(rover.position).to eq("1 3 N")
    end
  end

  context "when the rover is at (3,3,E) with new orientantion" do
    let(:x) { 3 }
    let(:y) { 3 }
    let(:orientation) { "E" }

    it "expects rover to move until point" do
      rover.navigate

      expect(rover.position).to eq("5 1 E")
    end
  end

  context "when the rover is at (10,10,N)" do
    let(:x) { 10 }
    let(:y) { 10 }

    it "expects rover to move until point" do
      rover.navigate

      expect(rover.position).to eq("10 10 N")
    end
  end
end
