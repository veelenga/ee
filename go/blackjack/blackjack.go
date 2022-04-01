package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	switch card {
	case "two":
		return 2
	case "three":
		return 3
	case "four":
		return 4
	case "five":
		return 5
	case "six":
		return 6
	case "seven":
		return 7
	case "eight":
		return 8
	case "nine":
		return 9
	case "ten", "jack", "queen", "king":
		return 10
	case "ace":
		return 11
	default:
		return 0
	}
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	if card1 == "ace" && card2 == "ace" {
		return "P"
	}
	c1 := ParseCard(card1)
	c2 := ParseCard(card2)
	d := ParseCard(dealerCard)

	switch s := (c1 + c2); {
	case s == 11:
		return "H"
	case s >= 11 && s < 17:
		if d < 7 {
			return "S"
		} else {
			return "H"
		}
	case s >= 17 && s < 21:
		return "S"
	case s == 21:
		if d >= 10 {
			return "S"
		} else {
			return "W"
		}

	default:
		return "H"
	}
}
