//
//  Game.swift
//  4Gewinnt-SwiftUI
//
//  Created by Xaver Lohmüller on 05.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI
import Combine

final class Game: BindableObject {
    let didChange = PassthroughSubject<Void, Never>()

    private(set) var board: [[Cell]] {
        didSet { didChange.send(()) }
    }
    private(set) var activePlayer: Player = .red {
        didSet { didChange.send(()) }
    }

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
        for player in Player.allCases {
            // Check horizontal win
            for x in 0..<board.count - 3 {
                for y in 0..<board[0].count {
                    if board[x][y] == player.cell,
                        board[x + 1][y] == player.cell,
                        board[x + 2][y] == player.cell,
                        board[x + 3][y] == player.cell {
                        return player
                    }
                }
            }

            // Check vertical win
            for x in 0..<board.count {
                for y in 0..<board[0].count - 3 {
                    if board[x][y] == player.cell,
                        board[x][y + 1] == player.cell,
                        board[x][y + 2] == player.cell,
                        board[x][y + 3] == player.cell {
                        return player
                    }
                }
            }
        }
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
