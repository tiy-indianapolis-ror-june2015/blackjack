class Card
  attr_accessor :suit, :value, :face

  def initialize(suit, value)
    @suit = suit
    @face = value
    @value = determine_value(@face)
  end

  def determine_value(this_face)
    if %w(Jack Queen King).include? this_face
      10
    elsif this_face == "Ace"
      11
    else
      this_face
    end
  end

  def ==(card)
    self.value == card.value
  end

  def >(card)
    self.value > card.value
  end

  def <(card)
    self.value < card.value
  end

  def suited?(card)
    self.suit == card.suit
  end

end
