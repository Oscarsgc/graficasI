require_relative 'colorcito'
require_relative 'vector3d'
class Objeto
  attr_accessor :diff_color, :specular_color, :specular_coef, :normal

  def initialize(dc, ds, coef)
    @diff_color = dc
    @specular_color = ds
    @specular_coef = coef
    @normal = Vector3D.new(0.0, 0.0, 0.0)
  end

  def intersect(e, d)
  end

  def lambertian_shading(light, l)
    aux = @normal.dot_product(l)
    max = [0, aux].max
    i = light.color.multi(max, max, max)
    kd = @diff_color.multi(i.red, i.green, i.blue)

=begin
    second_member = @normal.dot_product(l)
    variable = [0, second_member].max
    pri = light.color.multi(variable, variable, variable)
    sec = pri.multi(@diff_color.red, @diff_color.green, @diff_color.blue)
    color = Colorcito.new(sec.red, sec.green, sec.blue)
=end
  end

  def blinn_phong_shading()

  end

  def set_normal(p)
  end

end