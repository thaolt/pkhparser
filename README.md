# pkhparser

Simplified poker hand parser for SEZAX's qualification test

## Problem

Given an input of 5 strings that each represent a playing card. Output a valid poker hand.

* A card is represented as a string that combines a char that represents a Suit and a string that represents a Rank. 
  * The chars that represent a Suit are, S(=Spades♠), H(=Hearts♡), D(=Diamonds♢), C(=Clovers♣). 
  * Tha strings that represent a Rank are 2, 3, …, 9, 10, J, Q, K, A.
  * For example, D3 means 3 of Diamonds. CA means A of Clovers. 
  
* The poker hands are shown in Table 1. If the 5 cards produce no hands, the output is “--”. 

* Cards don’t include a Joker and there are 52 cards in the deck.

Table 1: Poker hands and the descriptions of them

Hands|Description|String to output
---|---|---
Four cards|4 cards out of 5 has the same Rank.|4C
Full House|5 cards include One pair and Three cards.|FH
Three cards|3 cards out of 5 have the same Rank.|3C
Two pairs|5 cards include 2 pairs.|2P
One pair|2 cards out of 5 have the same rank.|1P

**Example**

If the input string is `D4C4C8D8S4`, then there is a Full House, so output is `FH`.

If the input string is `S8D3HQS3CQ`, it has Two pairs. the output is `2P`.

## How to run

### Interactive

```
ruby pkhparser.rb
```

### Pipeline

```
echo "D4C4C8D8S4" | ruby pkhparser.rb
```

Or

```
cat hands.txt | ruby pkhparser.rb
```
