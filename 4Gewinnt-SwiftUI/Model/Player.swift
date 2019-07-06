//
//  Player.swift
//  4Gewinnt-SwiftUI
//
//  Created by Xaver Lohmüller on 05.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

enum Player: CaseIterable {
    case red, yellow

    mutating func toggle() {
        switch self {
        case .red: self = .yellow
        case .yellow: self = .red
        }
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        switch self {
        case .red: return "🔴"
        case .yellow: return "🔶"
        }
    }
}
