require_relative 'renderer'
require_relative 'camera'
require_relative 'luz'

class RayTracer < Renderer

  attr_accessor :objects, :camera, :light

  def initialize(width, height)
    super(width, height, 255.0, 255.0, 255.0)
    @objects = Array.new
    @camera = Camera.new(Vector3D.new(278.0, 273.0, -800.0), Vector3D.new(0.0, 1.0, 0.0), Vector3D.new(278.0, 273.0, -700), 39.31, 0.035, width, height)
    @light = Luz.new(Vector3D.new(278.0, 547.0, 279.5), Colorcito.new(0.8, 0.7, 0.6))
  end

  def calculate_pixel(i, j)
    {red: i.to_f / width, green: j.to_f / height, blue: 1.0}
    e = @camera.e
    d = @camera.get_d(i,j)
    tmin =  +1.0/0.0
    oint = nil
    @objects.each do |object|
      t = object.intersect(e, d)
      if(t < tmin)
        tmin = t
        oint = object
      end
    end
    if oint.nil?
      color = Colorcito.new(255.0, 255.0, 255.0)
    else
      p = e.add(d.scalar_product(tmin))
      oint.set_normal(p)
      aux= @light.location.minus(p)
      l = aux.scalar_division(aux.mod)
      color = oint.lambertian_shading(@light, l)
      #color = oint.diff_color
    end
    {red: color.red, green: color.green, blue: color.blue}
  end

  def add_objects(object)
    @objects << object
  end

end