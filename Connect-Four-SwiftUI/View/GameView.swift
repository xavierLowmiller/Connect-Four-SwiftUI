//
//  GameView.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 06.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

struct GameView : View {
    @ObservedObject var game: Game

    var body: some View {
        Group {
            if game.winner == nil {
                BoardView(game: game)
            } else {
                WinnerView(winner: game.winner!)
                    .onTapGesture { self.game.reset() }
            }
        }
    }
}

#if DEBUG
struct GameView_Previews : PreviewProvider {
    static var previews: some View {
        let game = Game()
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 3)
        return GameView(game: game)
    }
}
#endif
