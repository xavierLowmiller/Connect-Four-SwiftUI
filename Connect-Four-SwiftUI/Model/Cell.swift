//
//  Cell.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 05.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

enum Cell {
    case red, yellow, empty
}

extension Player {
    var cell: Cell {
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        }
    }
}

extension Cell: CustomStringConvertible {
    var description: String {
        switch self {
        case .red: return "🔴"
        case .yellow: return "🔶"
        case .empty: return "⚪️"
        }
    }
}
