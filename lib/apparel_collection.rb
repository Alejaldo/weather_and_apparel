class ApparelCollection

  def initialize(apparels = [])
    @apparels = apparels
  end

  def self.from_dir(dir_path)
    apparels = Dir[dir_path].map do |apparel_file|
      Apparel.from_file(apparel_file)
    end

    self.new(apparels)
  end

  def to_a
    @apparels
  end

  def types
    to_a.map { |apparel| apparel.type }.uniq
  end

  def group_by_type(type)
    to_a.select { |apparel| apparel.type == type }.map do |apparel|
      apparel
    end
  end

  def whole_temp_range
    to_a.map {|apparel| apparel.temperature_range[1] }.
    concat(to_a.map {|apparel| apparel.temperature_range[0] }).
    uniq
  end
end
