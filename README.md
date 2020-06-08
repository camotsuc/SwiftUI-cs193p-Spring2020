# SwiftUI-cs193p-Spring2020
Here I will upload solutions for assignments of cs193p 2020

[Assignment 1](https://github.com/camotsuc/SwiftUI-cs193p-Spring2020#assignment-1)

# Assignment 1

# 2
We have our ViewModel in the file called **EmojiMemoryGame**, and in the computing var **cards** we returning all of our cards, so I think we need to shuffle the cards there.
```swift
var cards: Array<MemoryGame<String>.Card> {
        return model.cards.shuffled() // Adding .shuffled() there
    }
```
In swift we have a built-in method called **shuffled()**, and he is shuffling elements.

# 3
Changing ratio surely is a UI thing, so we need to change something in our View.
Luckily, we have a built-in method called **aspectRatio()**, so we need to use it
```swift
HStack {
            return ForEach(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                    
                }
                .aspectRatio(2/3, contentMode: .fit) // Here the aspectRatio() Usage
            }
        }
```

# 4

We are returning **numberOfPairsOfCards** in the **EmojiMemoryGame** in the function called **createMemoryGame()**, so all what we need is generate random number from 2 to 5 and set it as **numberOfPairsOfCards**.
```swift
return MemoryGame<String>(numberOfPairsOfCards: .random(in: 2...5)) { pairIndex in emojis[pairIndex]} 
//Take note at .random(in: 2...5) here we're generating numberOfPairsOfCards 
```

# 5
Changing fonts is UI thing,so we need to change something in our View.
I decided to solve this problem in one line, and used ternary operator for that.
```swift
struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            return ForEach(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                    
                }
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .font(viewModel.cards.count ==  5 ? .largeTitle : .title) // Ternary operator here.
        .padding()
        .foregroundColor(Color.orange)
        
    }
}
```

# Extra credit
I think that one of the ways to solve this is to change the **emojis** array in the **EmojiMemoryGame**.
My solution is **deleting** some emojis.
```swift
while emojis.count > 5 {
            emojis.remove(at: emojis.firstIndex(of: emojis.randomElement()!)!)
        }
```

# Thanks, if you found any mistake here, please report it
