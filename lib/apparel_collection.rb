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

  def apparel_types
  end

  def same_type_apparel
  end
end
