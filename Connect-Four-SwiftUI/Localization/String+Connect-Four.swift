//
//  String+Connect-Four.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 18.08.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import Foundation

extension String {
    static func localizedColumn(_ number: Int) -> String {
        let format = "Column %i"
            .localized("The currently selected column")
        return localizedStringWithFormat(format, number)
    }

    static let player1Description: String = "player_1_description"
        .localized("Player 1, mainly used for a11y")

    static let player2Description: String = "player_2_description"
        .localized("Player 2, mainly used for a11y")

    static let emptyDescription: String = "empty_description"
        .localized("An empty field, mainly used for a11y")
}


private extension String {
    func localized(_ comment: String) -> String {
        NSLocalizedString(self, comment: comment)
    }
}
