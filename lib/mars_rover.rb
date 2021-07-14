require_relative "../lib/rover"
class MarsRover
  attr_reader :instruction_set

  def self.run(instruction_set)
    new(instruction_set).call
  end

  def initialize(instruction_set)
    @instruction_set = instruction_set.split("\n")
    @maxX = 0
    @maxY = 0
    @rovers = []
    @rover_positions = []
  end

  def call
    get_max_coordinates
    get_rovers
    navigate_rovers
  end

  private

  def get_max_coordinates
    @maxX = @instruction_set[0].to_s.split[0].to_i
    @maxY = @instruction_set[0].to_s.split[1].to_i
  end

  def get_rovers
    rovers_set = @instruction_set[1..-1]
    num_of_rovers = rovers_set.length / 2

    num_of_rovers.times do |index|
      position = rovers_set[index * 2].split
      instructions = rovers_set[(index * 2) + 1]
      rover = Rover.new(position[0].to_i, position[1].to_i, @maxX, @maxY, position[2], instructions)
      @rovers = @rovers.push(rover)
    end
  end

  def navigate_rovers
    @rovers.each do |rover|
      rover.navigate
      @rover_positions << rover.position
    end

    result = @rover_positions.join("\n")
    puts result
    return result
  end
end

MarsRover.run("5 5\n1 2 N\nL M L M L M L M M\n3 3 E\nM M R M M R M R R M")
