//
//  ContentView.swift
//  DungeonDice
//
//  Created by Dola Fakeye on 9/24/25.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable, Identifiable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        var id: Int { // one value computed properties (or functions) dont need return
            rawValue //Each rawValue is unique, so it's a good ID
        }
        
        var description: String {
           return "\(rawValue)-sided"
        }
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }

    @State private var resultMessage = ""
    
    var body: some View {
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.red)
            
            Spacer()
            
            Text(resultMessage)
                .font(.largeTitle)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(height: 150)
            
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 102))]) {
                ForEach(Dice.allCases) {dice in
                    Button(dice.description) {
                        resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
