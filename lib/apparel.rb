class Apparel
  attr_reader :title, :type, :temperature_range

  def self.from_file(apparel_file)
    lines = File.readlines(apparel_file, chomp: true)

    self.new(
      title: lines[0],
      type: lines[1],
      temperature_range: lines[2]
    )
  end
  
  def initialize(params)
    @title = params[:title] 
    @type = params[:type].to_sym 
    @temperature_range = params[:temperature_range].gsub(/[^\d,-]/, '').split(',').map { |value| value.to_i }
  end

  def suitable?(user_input)
    user_input.between?(@temperature_range[0], @temperature_range[1])
  end

  def to_s
    "#{@title} (#{@type}) #{@temperature_range[0]} .. #{@temperature_range[1]} °С"
  end
end
