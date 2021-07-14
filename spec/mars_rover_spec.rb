require "mars_rover"

RSpec.describe MarsRover, "#run" do
  let(:mars_rover_positions) { MarsRover.run(instructions_set) }
  let(:instructions_set) {
    <<~INSTRUCUTION
      5 5
      1 2 N
      L M L M L M L M M
      3 3 E
      M M R M M R M R R M
    INSTRUCUTION
  }

  context "with many rovers" do
    it "expects the final positions to be accurate" do
      expect(mars_rover_positions).to eq("2 2 N")
    end
  end

  context "with one rover" do
    let(:instructions_set) {
      <<~INSTRUCUTION
        5 5
        1 2 N
        L M L M L M L M M
      INSTRUCUTION
    }

    it "expects the final positions to be accurate" do
      expect(mars_rover_positions).to eq("2 2 N")
    end
  end
end
