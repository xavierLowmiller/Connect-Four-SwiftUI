//
//  GameView.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 06.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

struct GameView : View {
    @ObjectBinding var game: Game

    var body: some View {
        Group {
            if game.winner == nil {
                BoardView(game: game)
            } else {
                WinnerView(winner: game.winner!)
            }
        }
    }
}

#if DEBUG
struct GameView_Previews : PreviewProvider {
    static var previews: some View {
        let game = Game(columns: 7, rows: 6)
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 3)
        return GameView(game: game)
    }
}
#endif
