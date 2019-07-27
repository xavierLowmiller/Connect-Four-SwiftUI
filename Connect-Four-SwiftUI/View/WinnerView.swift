//
//  WinnerView.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 06.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

struct WinnerView : View {
    let winner: Player

    var body: some View {
        VStack {
            CellView(cell: winner == .red ? .red : .yellow)
                .accessibility(label: Text(winner == .red ? "red" : "yellow"))
            Text("won the game")
        }.padding()
    }
}

#if DEBUG
struct WinnerView_Previews : PreviewProvider {
    static var previews: some View {
        WinnerView(winner: .red)
    }
}
#endif
