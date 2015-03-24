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
  end

  def blinn_phong_shading(light, h, l)
    #primer miembro
    first_member = lambertian_shading(light, l)

    aux = @normal.dot_product(h)
    max = [0, aux].max
    var = max ** @specular_coef
    i = light.color.multi(var, var, var)
    ks = @specular_color.multi(i.red, i.green, i.blue)

    color = first_member.add(ks.red, ks.green, ks.blue)

  end

  def set_normal(p)
  end

end