//
//  Token+SwiftUI.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 18.08.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

private extension Token {
    var accessibilityDescription: String {
        switch self {
        case .red: return .player1Description
        case .yellow: return .player2Description
        case .empty: return .emptyDescription
        }
    }
}

extension Array where Element == Token {
    var accessibilityDescription: String {
        let filledElements = filter { $0 != .empty }

        if filledElements.isEmpty {
            return .emptyDescription
        } else {
            return filledElements
                .reversed()
                .map { $0.accessibilityDescription }
                .joined(separator: ", ")
        }
    }
}
