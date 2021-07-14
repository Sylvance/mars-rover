class Rover
  attr_reader :x, :y, :maxX, :maxY, :orientation, :instructions

  def initialize(x=0, y=0, maxX, maxY, orientation='N', instructions)
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
    @instructions.split('').each do |instruction|
      if instruction == 'M'
        move
      else
        rotate(instruction)
      end
    end
  end

  private

  def move
    case @orientation
    when 'N' then @y += 1 if @y < @maxY
    when 'S' then @y -= 1 if @y > 0
    when 'E' then @x += 1 if @x < @maxX
    when 'W' then @x -= 1 if @x > 0
    end
  end

  def rotate(direction)
    case direction
    when 'L' then turn_left
    when 'R' then turn_right
    end
  end

  def turn_left
    case @orientation
    when 'N'
      @orientation = 'W'
    when 'E'
      @orientation = 'N'
    when 'S'
      @orientation = 'E'
    when 'W'
      @orientation = 'S'
    else
      break
    end
  end

  def turn_right
    case @orientation
    when 'N'
      @orientation = 'E'
    when 'E'
      @orientation = 'S'
    when 'S'
      @orientation = 'W'
    when 'W'
      @orientation = 'N'
    else
      break
    end
  end
end
