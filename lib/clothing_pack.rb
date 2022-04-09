require_relative "clothing"

class ClothingPack

  def self.from_folder(path)
    file_paths = Dir.glob(File.join(path, "*.txt"))
    clothing_array = file_paths.map do |file_path|
      lines = File.readlines(file_path, chomp: true)
      temp_range = lines[2].scan(/[+-]?\d+/)
      Clothing.new(
        lines[0],
        lines[1],
        Range.new(temp_range[0].to_i,temp_range[1].to_i)
      )
    end
    new(clothing_array)
  end

  def initialize(clothing_array)
    @all_clothings = clothing_array
    @types_of_clothings = @all_clothings.map { |clothing| clothing.type}.uniq
  end

  def get_look(temp)
    look = @types_of_clothings.map do |type|
      matching_clothes = @all_clothings.select { |clothing| clothing.type == type && clothing.fit_for_temp?(temp)}
      if matching_clothes.empty?
        "Подходящей вещи типа «#{type}» в гардеробе нет"
      else
        matching_clothes.sample
      end
    end
    look.join("\n")
  end
end
