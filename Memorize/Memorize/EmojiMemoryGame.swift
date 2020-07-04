import Foundation

class EmojiMemoryGame {
    private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = ["👻","🎃","🕷","😈","💀","👽","☠️","👾"]

        while emojis.count > 5 {
            emojis.remove(at: emojis.firstIndex(of: emojis.randomElement()!)!)
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: .random(in: 2...4)) { pairIndex in emojis[pairIndex]}
    }
    
    //MARK: -Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
