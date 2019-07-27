//
//  CellView.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 06.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

struct CellView : View {
    let cell: Token

    var body: some View {
        Circle()
            .foregroundColor(cell.color)
            .shadow(radius: 10)
            .padding(6)
        .frame(width: 80, height: 80)
    }
}

extension Token {
    var color: Color {
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        case .empty: return .white
        }
    }
}

#if DEBUG
struct CellView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CellView(cell: .red)
            CellView(cell: .yellow)
            CellView(cell: .empty)
        }
    }
}
#endif

