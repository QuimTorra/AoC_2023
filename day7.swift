// =========== AOC d7 =========== 
// =========== PART 1 ===========

let cards = "AKQJT98765432"

func checkHand(hand: String) -> Int {
  var cardCount: [Character: Int] = [:]
  for card in hand {
    cardCount[card, default: 0] += 1
  }

  let v = Array(cardCount.values) 
  if v.contains(5) {
    return 6
  } else if v.contains(4) {
    return 5
  } else if v.contains(3) && v.contains(2) {
    return 4
  } else if v.contains(3) {
    return 3
  } else if v.contains(2) && v.count == 3 {
    return 2
  } else if v.contains(2) && v.count == 4 {
    return 1
  } else {
    return 0
  }
}

func compareHands(a: Hand, b: Hand) -> Bool {
  if (a.p > b.p) { return false }
  else if (a.p == b.p) {
    for i in 0..<5 {
      let aix = cards.distance(from: cards.startIndex, to: cards.firstIndex(of: Array(a.hand)[i])!)
      let bix = cards.distance(from: cards.startIndex, to: cards.firstIndex(of: Array(b.hand)[i])!)
      print(aix, bix)
      if (aix < bix) { return false }
      if (aix > bix) { return true }
    }
  }
  return true
}

struct Hand { var p: Int
             var hand: String
             var bid: Int } 
var hands = [Hand]()

while let input = readLine() {
  if input == "end" {
      break
  }
  let l = input.split(separator: " ")

  let hand = String(l[0])
  let bid = Int(l[1]) ?? 0
  let points = checkHand(hand: hand)

  hands.append(Hand(p: points, hand: hand, bid: bid))
}

hands = hands.sorted(by: compareHands)
var total = 0
for i in 0..<hands.count {
  total += hands[i].bid * (i+1)
}
print(total)

// =========== PART 2 ===========

let cards = "AKQT98765432J"

func checkHand(hand: String) -> Int {
  var cardCount: [Character: Int] = [:]
  var mostRepeatedCard: Character = Array(hand)[0]
  var jokers: Int = 0;
  for card in hand {
    if (card == "J") {
      jokers += 1
      continue
    }
    cardCount[card, default: 0] += 1
    if (cardCount[card, default: 0] > cardCount[mostRepeatedCard, default: 0]) {
      mostRepeatedCard = card
    }
  }

  cardCount[mostRepeatedCard, default: 0] += jokers

  let v = Array(cardCount.values) 
  if v.contains(5) {
    return 6
  } else if v.contains(4) {
    return 5
  } else if v.contains(3) && v.contains(2) {
    return 4
  } else if v.contains(3) {
    return 3
  } else if v.contains(2) && v.count == 3 {
    return 2
  } else if v.contains(2) && v.count == 4 {
    return 1
  }
  return 0
}

func compareHands(a: Hand, b: Hand) -> Bool {
  if (a.p > b.p) { return false }
  else if (a.p == b.p) {
    for i in 0..<5 {
      let aix = cards.distance(from: cards.startIndex, to: cards.firstIndex(of: Array(a.hand)[i])!)
      let bix = cards.distance(from: cards.startIndex, to: cards.firstIndex(of: Array(b.hand)[i])!)
      if (aix < bix) { return false }
      if (aix > bix) { return true }
    }
  }
  return true
}

struct Hand { var p: Int
             var hand: String
             var bid: Int } 
var hands = [Hand]()

while let input = readLine() {
  if input == "end" {
      break
  }
  let l = input.split(separator: " ")

  let hand = String(l[0])
  let bid = Int(l[1]) ?? 0
  let points = checkHand(hand: hand)

  hands.append(Hand(p: points, hand: hand, bid: bid))
}

hands = hands.sorted(by: compareHands)
var total = 0
for i in 0..<hands.count {
  total += hands[i].bid * (i+1)
}
print(total)