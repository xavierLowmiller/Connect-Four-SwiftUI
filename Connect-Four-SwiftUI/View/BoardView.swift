//
//  BoardView.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 05.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

struct BoardView : View {
    @ObservedObject var game: Game

    var body: some View {
        VStack {

            HStack {
                Spacer()
                Text(.nextPlayerText)
                    .font(.largeTitle)
                CellView(cell: game.activePlayer == .red ? .red : .yellow)
                    .accessibility(label: Text(game.activePlayer == .red ? "player_1_description" : "player_2_description"))
                Spacer()
            }.padding(.top, 25)

            HStack(spacing: 0) {

                ForEach(Array(game.board.enumerated()), id: \.offset) { (xOffset, column) in

                    ZStack {
                        Color.blue
                        VStack(spacing: 0) {
                            ForEach(Array(column.enumerated()), id: \.offset) { (yOffset, cell) in
                                CellView(cell: cell)
                            }
                        }
                    }
                    .onTapGesture {
                        self.game.insert(at: xOffset)
                    }
                    .accessibility(label: Text("Column \(xOffset + 1)"))
                    .accessibility(value: Text(column.accessibilityDescription))
                    .accessibility(hint: Text("a11y_drop_hint_text"))
                    .accessibility(addTraits: .allowsDirectInteraction)
                    .accessibilityAction { self.game.insert(at: xOffset) }
                }

            }
            .padding(8)
        }
    }
}


#if DEBUG
struct BoardView_Previews : PreviewProvider {
    static var previews: some View {
        let game = Game()
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 3)
        return BoardView(game: game)
    }
}
#endif
