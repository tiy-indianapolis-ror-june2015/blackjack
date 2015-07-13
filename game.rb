require_relative 'card'
require_relative 'deck'

class Game

  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = @deck.cards.shift(2)
    @dealer = @deck.cards.shift(2)
  end

  def play
    blackjack_or_bust?
    display_hands
    hit_or_stay?
  end

  def blackjack_or_bust?
    if hand_value(dealer) == 21 && dealer.length == 2
      puts "DEALER BLACKJACK! You lost. _sad trombone_"
      play_again?
    elsif hand_value(player) == 21 && player.length == 2
      puts "BLACKJACK! You win!"
      play_again?
    elsif hand_value(player) > 21
      puts "BUSTED! You have #{hand_value(player)} points."
      play_again?
    elsif hand_value(dealer) > 21
      puts "DEALER BUST! The computer has #{hand_value(dealer)}. YOU WIN!"
      play_again?
    end
  end

  def display_hands(all_dealer=false)
    player.each do |card|
      puts "You have a #{card.face} of #{card.suit}."
    end
    puts "For a total value of #{hand_value(player)}."
    if all_dealer
      dealer.each do |card|
        puts "The dealer has a #{card.face} of #{card.suit}."
      end
      puts "For a total value of #{hand_value(dealer)}."
    else
      puts "The dealer is showing a #{dealer.first.face} of #{dealer.first.suit}."
    end
  end

  def hit_or_stay?
    puts "Would you like to hit or stay (h/s)?"
    desire = gets.chomp.downcase[0]
    if desire == "h"
      player_hit
    else
      dealer_turn
    end
  end

  def player_hit
    player << deck.cards.shift
    blackjack_or_bust?
    display_hands
    win_on_six?
    hit_or_stay?
  end

  def win_on_six?
    if player.length == 6 && hand_value(player) <= 21
      puts "YOU WIN! You drew six cards without busting."
      play_again?
    end
  end

  def dealer_turn
    while hand_value(dealer) < 16
      dealer << deck.cards.shift
    end
    display_hands(true)
    blackjack_or_bust?
    determine_winner
  end

  def determine_winner
    if hand_value(player) > hand_value(dealer)
      puts "YOU WIN!"
    elsif hand_value(player) == hand_value(dealer)
      if player.length >= dealer.length
        puts "YOU WIN!"
      else
        puts "YOU LOST!"
      end
    else
      puts "YOU LOST!"
    end
    play_again?
  end

  def hand_value(contestant)
    contestant.inject(0){|sum, card| sum + card.value}
  end

  def play_again?
    puts "Would you like to play again (y/n)?"
    desire = gets.chomp.downcase
    if desire == "y"
      Game.new.play
    else
      exit
    end
  end

end

Game.new.play
