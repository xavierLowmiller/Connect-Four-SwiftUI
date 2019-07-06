//
//  BoardView.swift
//  4Gewinnt-SwiftUI
//
//  Created by Xaver Lohmüller on 05.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

struct BoardView : View {
    @ObjectBinding var game: Game

    var body: some View {
        VStack {

            HStack {
                Spacer()
                Text("Up next:")
                    .font(.largeTitle)
                    .padding(.top)
                Circle()
                    .foregroundColor(game.activePlayer == .red ? .red : .yellow)
                Spacer()
            }.padding(.top, 25)

            HStack(spacing: 0) {

                ForEach(Array(game.board.enumerated()).identified(by: \.offset)) { (offset, column) in

                    VStack(spacing: 0) {
                        ForEach(column.identified(by: \.self)) { cell in
                            CellView(cell: cell)
                        }
                    }.tapAction {
                        self.game.insert(at: offset)
                    }
                }

            }
            .padding(8)
            .background(Color.blue)
        }
    }
}


#if DEBUG
struct BoardView_Previews : PreviewProvider {
    static var previews: some View {
        let game = Game(columns: 7, rows: 6)
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 3)
        return BoardView(game: game)
    }
}
#endif
