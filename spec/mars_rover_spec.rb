require "mars_rover"

RSpec.describe MarsRover, "#run" do
  let(:mars_rover_positions) { MarsRover.run(instructions_set) }
  let(:instructions_set) { "5 5\n1 2 N\nL M L M L M L M M\n3 3 E\nM M R M M R M R R M" }

  context "with many rovers" do
    it "expects the final positions to be accurate" do
      expect(mars_rover_positions).to eq("1 3 N\n5 1 E")
    end
  end

  context "with one rover" do
    let(:instructions_set) { "5 5\n1 2 N\nL M L M L M L M M" }

    it "expects the final positions to be accurate" do
      expect(mars_rover_positions).to eq("1 3 N")
    end
  end
end
