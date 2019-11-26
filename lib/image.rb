class Image
  attr_accessor :data

  def initialize(data)
    @data = data
    @array_length = data.length
    @array_position = data[0].length
  end

  def blur 
    set_px = find_all_ones

    set_px.each do |x, y|
      image_blur(x,y)
    end
    return Image.new(@data)
  end

  def image_blur(row_number,position_number)
      @data[row_number -1][position_number] = 1 unless row_number == 0
      @data[row_number +1][position_number] = 1 unless row_number >= @array_length-1
      @data[row_number][position_number -1] = 1 unless position_number == 0
      @data[row_number][position_number +1] = 1 unless position_number >= @array_position-1
  end

  def find_all_ones
    ones = []
    @data.each_with_index do |row, row_number|
      row.each_with_index do |position, position_number|
        if position == 1
          ones << [row_number,position_number]
        end
      end
    end
    ones
  end
end




