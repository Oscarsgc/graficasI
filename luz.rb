require_relative 'colorcito'
require_relative 'vector3d'
class Luz

  attr_accessor :location, :color

  def initialize(location, color)
    @location = location
    @color = color
  end

end