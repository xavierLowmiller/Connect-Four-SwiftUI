//
//  Game.swift
//  4Gewinnt-SwiftUI
//
//  Created by Xaver Lohmüller on 05.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

final class Game {

    private(set) var board: [[Cell]]
    private(set) var activePlayer: Player = .red

    init(columns: Int, rows: Int) {
        let emptyRow = [Cell](repeating: .empty, count: rows)
        board = [[Cell]](repeating: emptyRow, count: columns)
    }

    func insert(at column: Int) {
        guard (0..<board.count) ~= column,
            let row = board[column].lastIndex(of: .empty)
            else { return }

        board[column][row] = activePlayer.cell
        activePlayer.toggle()
    }

    var winner: Player? {
        return nil
    }

    func isColumnSelectable(_ column: Int) -> Bool {
        return board[column].contains(.empty)
    }
}

extension Game: CustomStringConvertible {
    var description: String {
        var description = "Player \(activePlayer)'s turn\n"
        for j in 0..<board[0].count {
            for i in 0..<board.count {
                description += board[i][j].description
            }
            description += "\n"
        }
        return description
    }
}
