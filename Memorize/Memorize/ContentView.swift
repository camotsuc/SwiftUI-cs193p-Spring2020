import SwiftUI

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
        .font(viewModel.cards.count ==  5 ? .largeTitle : .title)
        .padding()
        .foregroundColor(Color.orange)
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill().foregroundColor(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
                
            }else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
