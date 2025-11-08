/*:
 ## CIS137 iOS/SWIFT Programming
 
 ## Partner Lab 03 
 
 Students: Esmira Babayeva, Nagihan Tokul
 
 Instructor: Hellen Pacheco
 
 Date: 09 November, 2025
 
 ContentView.swift (View)
 
 Simple memory game.
  
 */


// View → The UI layer that shows things on screen and reacts to user actions.



import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel: FlowerMemoryGame
    @State private var bounce = false
    @State private var colorChange = false
   
    
    let columns = [GridItem(.adaptive(minimum: 100))]

    
    
    var body: some View {
        // Scrolling the layout vertically
        ScrollView {
            VStack {
                Text("Memory Game")
                    .font(.largeTitle)
                    // change of color depending on colorChange value
                    .foregroundColor(colorChange ? .red : .blue) // color change
                    .bold()
                    .padding(.top)
                // Change of text position depending on bounce value
                    .offset(y: bounce ? -8 : 0) //moving up along y axis
                    .onTapGesture {
                        // change of state: text moves up a bit and changes color
                        withAnimation(.spring(response: 1, dampingFraction: 0.4)) {
                                    bounce.toggle()
                                    colorChange.toggle()
                                }
                        // runs back after a short delay
                        withAnimation(.spring(response: 0.7, dampingFraction: 0.6).delay(0.3)) {
                                    bounce.toggle()
                                    colorChange.toggle()
                                }
                    }

                // Grid look
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(1, contentMode: .fit)
                            .onTapGesture {
                                withAnimation(.spring(response: 1.0, dampingFraction: 0.8)) {
                                    viewModel.choose(card)
                                }
                            }
                    }
                }
                .padding()
            }
        }
    }
}

// Individual grid cell's/card's look
// Image is replaced with blue square on tap
struct CardView: View {
    let card: MemoryGame.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 3)
                Image(card.content)
                    .resizable()
                    .scaledToFit()
                    .padding(8)
            } else {
                RoundedRectangle(cornerRadius: 10) // single blue rectangle's measurements
                    .fill(Color.blue.opacity(1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 3)
                    )
            }
        }
        // rotates the card around the given axis
        // for image not to bee seen before 90 degree more comlex approach needed
        .rotation3DEffect(.degrees(card.isFaceUp ? 0 : 180), axis: (x: 1, y: 1, z: 0), perspective: 0.6)
        
        .padding(4)
    }
}

#Preview {
    ContentView(viewModel: FlowerMemoryGame())
}

