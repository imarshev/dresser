require_relative "clothing"

class ClothingPack
  def initialize(path)
    @all_clothings = get_clothing_from_folder(path)
    @types_of_clothings = @all_clothings.map { |clothing| clothing.type}.uniq
  end

  def get_clothing_from_folder(path)
    file_paths = Dir.glob(File.join(path, "*.txt"))
    file_paths.map do |file_path|
      lines = File.readlines(file_path, chomp: true)
      temp_range = lines[2].scan(/[+-]?\d+/)
      Clothing.new(
        lines[0],
        lines[1],
        Range.new(temp_range[0].to_i,temp_range[1].to_i)
      )
    end
  end

  def get_look(temp)
    look = @types_of_clothings.map do |type|
      matching_clothes = @all_clothings.select { |clothing| clothing.type == type && clothing.temp_range.include?(temp)}
      if !matching_clothes.empty?
        matching_clothes.sample
      else
        "Подходящей вещи типа «#{type}» в гардеробе нет"
      end
    end
    look.join("\n")
  end
end
