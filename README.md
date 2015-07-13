# Blackjack

## Description
Blackjack Ruby console game


## Objectives

### Learning Objectives

After completing this assignment, you should…

* Use control-flow (having the computer make decisions)
* Create a user interface
* Use data-flow (your deck is a unique set of resources)


### Performance Objectives

After completing this assignment, you be able to effectively use

* Classes
* Arrays
* Console / Terminal




## Details

Code you may want
-----------------

```ruby

#... snip
suits = [:hearts, :diamonds, :spades, :clubs]
suits.each do |suit|
  (2..10).each do |value|
    @cards << Card.new(suit, value)
  end
  @cards << Card.new(suit, "J")
  @cards << Card.new(suit, "Q")
  @cards << Card.new(suit, "K")
  @cards << Card.new(suit, "A")
end
```

### Deliverables

* A gist containing at least:
  * `blackjack.rb` : your game class
  * `card.rb` : your Card class
  * `deck.rb` : your Deck class

To submit your assignment:

* Create a gist, with 1 file per class
* Submit a link to this gist as a comment on your GitHub Issue.

### Requirements

* You should create classes for your data, and use methods instead of having one big loop


## Normal Mode

0. don't consider Aces as possible 1's ... they are always 11s
0. This is a 2 hand game (dealer and player)
0. no splitting or funny business
0. 1 deck in the game
0. 52 card deck
0. NO WILDS
0. New deck every game
0. deck must be shuffled every game
0. no betting at all
0. must have suits (ace of diamonds)
0. Dealer hits if less than 16, otherwise dealer stays
0. You enter what you play
0. No if you get 5 cards you win funnybusiness
0. get as close to 21 without going over
0. Must beat the dealer
0. you can see 1 of dealers cards, while you are playing
0. If you get blackjack, you win automagically
0. Ties go to the player


## Hard Mode

1. You win if you have 6 cards and stay under 21
1. Dealer wins if it draws blackjack before any player actions
1. Ties go to the hand with the most cards, if still tied, it goes to the player

## Nightmare Mode

1. Add the idea of tracking your progress as you play over time.
1. Let the player choose if an Ace is a 1 or an 11
1. Add 7 decks to the game in a "Shoe", shuffle them all together, deal from the "Shoe"



## Notes

This can be fairly challenging, and is the end of our adventure in pure Ruby programming.

## Additional Resources

* [Play Blackjack](http://freeblackjackdoc.com/blackjack-game.htm)  
* [Info on Blackjack](https://en.wikipedia.org/wiki/Blackjack)
