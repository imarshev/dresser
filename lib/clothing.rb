class Clothing
  attr_reader :name, :type, :temp_range

  def initialize(name, type, temp_range)
    @name = name
    @type = type
    @temp_range = temp_range
  end

  def to_s
    "#{@name} (#{@type}) #{@temp_range}"
  end

  def fit_for_temp?(temp)
    @temp_range.include?(temp)
  end
end
