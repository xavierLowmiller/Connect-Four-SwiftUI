//
//  Token.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 05.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

enum Token {
    case red, yellow, empty
}

extension Player {
    var cell: Token {
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        }
    }
}

extension Token: CustomStringConvertible {
    var description: String {
        switch self {
        case .red: return "🔴"
        case .yellow: return "🔶"
        case .empty: return "⚪️"
        }
    }
}
