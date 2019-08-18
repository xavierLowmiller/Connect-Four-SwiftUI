//
//  WinnerView.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 06.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

struct WinnerView : View {
    @ObservedObject var game: Game

    var body: some View {
        VStack {
            CellView(cell: self.game.winner == .red ? .red : .yellow)
                .accessibility(label: Text(self.game.winner == .red ? "player_1_description" : "player_2_description"))
            Text("winner_description")
                .font(.largeTitle)
            Button(action: {
                self.game.reset()
            }, label: { Text("button_title_play_again") })
        }
    }
}

#if DEBUG
struct WinnerView_Previews : PreviewProvider {
    static let game: Game = {
        $0.insert(at: 0)
        $0.insert(at: 1)
        $0.insert(at: 0)
        $0.insert(at: 1)
        $0.insert(at: 0)
        $0.insert(at: 1)
        $0.insert(at: 0)
        return $0
    }(Game())

    static var previews: some View {
        WinnerView(game: game)
    }
}
#endif
