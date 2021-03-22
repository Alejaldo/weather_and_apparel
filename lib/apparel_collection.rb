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

  def types
    @apparels.map { |apparel| apparel.type }.uniq
  end

  def group_by_type(type)
    @apparels.select { |apparel| apparel.type == type }.map do |apparel|
      apparel
    end
  end

  def whole_temp_range
    all_max_extremums = @apparels.map { |apparel| apparel.temperature_range[1] }.sort
    all_min_extremums = @apparels.map { |apparel| apparel.temperature_range[0] }.sort

    full_range = (all_max_extremums + all_min_extremums).uniq.sort
  end

  def choose_suitable(user_input)
    types.
    map { |type| self.group_by_type(type) }.
    map { |apparel_group| apparel_group.select { |apparel| apparel.suitable?(user_input) } }
  end
end
