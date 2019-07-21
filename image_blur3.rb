class ImageBlur
  attr_accessor :allrows, :userInput

  def initialize(inc_array)
    @allrows = inc_array
  end

  def output_image
    @allrows.each do |row|
      puts row.join
    end
  end

  def self.user_input
    puts "Enter a blur distance (default is 1): "
    @userInput = gets.chomp.to_i
      if @userInput == 0
        @userInput = 1
      end
    @userInput
  end

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
  end
end

image =ImageBlur.new([
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ])
userInput = ImageBlur.user_input
image.blur_with_length(userInput)
image.output_image