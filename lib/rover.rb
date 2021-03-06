class Rover
  attr_accessor :x, :y, :maxX, :maxY, :orientation, :instructions

  def initialize(x=0, y=0, maxX, maxY, orientation, instructions)
    @x = x
    @y = y
    @maxX = maxX
    @maxY = maxY
    @orientation = orientation
    @instructions = instructions
  end

  def position
    "#{@x} #{@y} #{@orientation}"
  end

  def navigate
    @instructions.split(' ').each do |instruction|
      if instruction == 'M'
        move
      else
        rotate(instruction.to_sym)
      end
    end
  end

  private

  def move
    case @orientation.to_sym
    when :N then @y += 1 if @y < @maxY
    when :S then @y -= 1 if @y > 0
    when :E then @x += 1 if @x < @maxX
    when :W then @x -= 1 if @x > 0
    end
  end

  def rotate(direction)
    turn_left if direction == 'L'.to_sym
    turn_right if direction == 'R'.to_sym
  end

  def turn_left
    case @orientation.to_sym
    when :N
      @orientation = 'W'
    when :E
      @orientation = 'N'
    when :S
      @orientation = 'E'
    when :W
      @orientation = 'S'
    else
      @orientation = @orientation
    end
  end

  def turn_right
    case @orientation.to_sym
    when :N
      @orientation = 'E'
    when :E
      @orientation = 'S'
    when :S
      @orientation = 'W'
    when :W
      @orientation = 'N'
    else
      @orientation = @orientation
    end
  end
end
