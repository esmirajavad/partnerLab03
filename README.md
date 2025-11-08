Partner Lab 03 — Memory Game (SwiftUI, MVVM)

A simple flower-themed Memory Game built with SwiftUI using MVVM.
Tap cards to flip; the title has a playful bounce + color change on tap. Cards are laid out in a responsive grid.

FEATURES:

MVVM architecture

MemoryGame.swift → Model (cards, game state, logic)

FlowerMemoryGame.swift → ViewModel (exposes model to the UI)

ContentView.swift / CardView → View (SwiftUI UI & gestures)



3D flip animation via rotation3DEffect

Interactive title (bounce + color change using two timed spring animations)





HOW THE FLIP WORKS:

Tap a card:

withAnimation(.easeInOut(duration: 0.7)) {
    viewModel.choose(card)
}

The card view rotates based on state:

.rotation3DEffect(.degrees(card.isFaceUp ? 0 : 180),
                  axis: (x: 0, y: 1, z: 0),
                  perspective: 0.6)







PROJECT STRUCTURE:

PartnerLab03

├─ ContentView.swift        # View (UI, grid, title animations)

├─ FlowerMemoryGame.swift   # ViewModel (ObservableObject)

├─ MemoryGame.swift         # Model (Card, deck, choose logic)

└─ Assets.xcassets/         # flower1 … flower12 images




REQUIREMENTS:

Xcode 15+

iOS 17+ (SwiftUI)

RUN:

Open the project in Xcode.

Select an iOS Simulator (or device).

Build & run.

AUTHORS:

Esmira Babayeva, Nagihan Tokul

INSTRUCTOR: 

Hellen Pacheco

CIS137 iOS/Swift Programming 

Nov 09, 2025
