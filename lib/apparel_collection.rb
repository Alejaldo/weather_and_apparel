class ApparelCollection
  def self.from_dir(dir_path)
    apparels = Dir[dir_path].map do |apparel_file|
      Apparel.from_file(apparel_file)
    end

    self.new(apparels)
  end

  def initialize(apparels = [])
    @apparels = apparels
  end

  def whole_temp_range
    all_max_extremums = @apparels.map { |apparel| apparel.temperature_range[1] }.sort
    all_min_extremums = @apparels.map { |apparel| apparel.temperature_range[0] }.sort

    full_range = (all_max_extremums + all_min_extremums).uniq.sort
  end

  def choose_suitable(user_input)
    @apparels.
      select { |apparel| apparel if apparel.suitable?(user_input) }.
      group_by { |apparel| apparel.type }
  end
end
