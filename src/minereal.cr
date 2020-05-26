class Mineral
  getter name, hardness, crystal_struct

  def initializer(
    @name : String = "unkown",
    @hardness : Float64 = 0.0,
    @crystal_struct : String = "Some"
  )
  end
end

def mineral_with_crystal_struct(crystal_struct, minerals)
  minerals.find { |m| m.crystal_struct == crystal_struct }
end
