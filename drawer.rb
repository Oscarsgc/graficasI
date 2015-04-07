require_relative 'sphere'
class Drawer

  attr_accessor :spheres

  def initialize
    @spheres = Array.new
  end

  def circle_drawer(sphere_qty, sphere_radius, y, spheres_color)
    for i in 0..sphere_qty
      sphere = Sphere.new(40, Vector3D.new(sphere_radius * Math.sin(i * (Math::PI/(sphere_qty / 2))) + 250, y, sphere_radius * Math.cos(i * (Math::PI/ (sphere_qty / 2))) + 200))
      #sphere.diff_color = Colorcito.new(0.156, 0.126, 0.506)
      sphere.diff_color = Colorcito.new(spheres_color.red, spheres_color.green, spheres_color.blue)
      sphere.specular_color = Colorcito.new(1.0, 1.0, 1.0)
      sphere.specular_coef = 100.0
      @spheres << sphere
    end
  end

end