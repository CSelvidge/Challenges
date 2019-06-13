class ImageBlur
  attr_accessor :allrows

  def initialize(inc_array)
    @allrows = inc_array

    @allrows
  end

  def output_image
    @allrows.each do |row|
      puts row.join

    end
  end



end
image =ImageBlur.new([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ])

image.output_image