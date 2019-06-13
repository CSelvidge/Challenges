class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
     
    arry_suit = [:Hearts, :Diamonds, :Spades, :Clubs]
    arry_rank = [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King]
   
      arry_suit.each do |suit|
       arry_rank.each do |rank|
         card = Card.new(rank, suit)

           @deck << card

        end
      end
      @deck
  end

   def self.deck_builder
    Deck.new
   end
   
   def deck_output
   puts "output"
    @deck.each do |card|
     card.output_card
    end
   end
   
   def deck_shuffle
   @deck =  @deck.shuffle
   end

  def deal
  puts @deck.count
  card = @deck.shift
  puts "Dealing..."
  card.output_card
 end
end

#Deck.deck_builder
obj = Deck.deck_builder
obj.deck_output
obj.deck_shuffle
obj.deck_output
obj.deal
obj.deal