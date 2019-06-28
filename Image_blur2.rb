class ImageBlur
  attr_accessor :allrows

  def initialize(inc_array)
    @allrows = inc_array
  end

  def output_image
    @allrows.each do |row|
      puts row.join

    end
  end

  def output_alternative
    @allrows.each do |row|
      row.each do |col|
        print col
      end
      puts ""
    end 
  end

  #def image_sure
  #  @allrows.each_with_index do |row , i|
  #    row.each_with_index  do |col , j|
  #      print @allrows[i][j]
  #    end
  #  puts ""
  #  end 
  #end
  

  def blur_with_length(length=1)
    length.times do
      get_location
    end
  end

  private

  def build_junk
    junkpile = []
    @allrows.each_with_index do |x, i|
      x.each_with_index do |y, x_i|
        junkpile << [i, x_i] if y == 1
      end 
    end
    junkpile
  end


  def get_location
    junkpile = build_junk

    junkpile.each do |location|
      x,y = location

      @allrows[x][y + 1] = 1 if y + 1 <= @allrows[x].length - 1
      @allrows[x][y - 1] = 1 if y - 1 >= 0
      @allrows[x + 1][y] = 1 if x + 1 <= @allrows.length - 1
      @allrows[x - 1][y] = 1 if x - 1 >= 0



    end
    @allrows
    p junkpile
  end
end

image =ImageBlur.new([
      [0, 0, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0],
      [0, 0, 0, 1, 0, 0]
    ])
image.blur_with_length(1)
image.output_image
#image.output_alternative
#image.image_sure