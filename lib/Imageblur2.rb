class Image
  def initialize(coordinates)
      @image = coordinates
      @array_length = coordinates.length
      @array_position = coordinates[0].length
  end

  def output_image
    @image.each do |x|
      puts x.join
    end
  end

  def image_blur(row_number,position_number)
      @image[row_number -1][position_number] = 1 unless row_number == 0
      @image[row_number +1][position_number] = 1 unless row_number >= @array_length-1
      @image[row_number][position_number -1] = 1 unless position_number == 0
      @image[row_number][position_number +1] = 1 unless position_number >= @array_position-1
  end

  def find_all_ones
    ones = []
    @image.each_with_index do |row, row_number|
      row.each_with_index do |position, position_number|
        if position == 1
          ones << [row_number,position_number]
        end
      end
    end
    ones
  end
  
  def change_image
    original_image = find_all_ones

    original_image.each do |x, y|
      image_blur(x,y)
    end
  end

end

image = Image.new([
  [0, 0, 0, 0, ],
  [0, 1, 0, 0, ],
  [0, 0, 0, 1, ],
  [0, 0, 0, 0, ]
])
puts ""
puts "Old Image"
image.output_image
puts ""
image.change_image
puts "New Image"
image.output_image
