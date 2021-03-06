//
//  Game.swift
//  Connect-Four-SwiftUI
//
//  Created by Xaver Lohmüller on 05.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import SwiftUI
import Combine

final class Game: ObservableObject {

    @Published private(set) var board: [[Token]]
    @Published var activePlayer: Player = .red

    init(columns: Int = 7, rows: Int = 6) {
        let emptyRow = [Token](repeating: .empty, count: rows)
        board = [[Token]](repeating: emptyRow, count: columns)
    }

    func insert(at column: Int) {
        guard (0..<board.count) ~= column,
            let row = board[column].lastIndex(of: .empty)
            else { return }

        board[column][row] = activePlayer.cell
        activePlayer.toggle()
    }

    func reset() {
        board = board.map { $0.map { _ in return .empty }}
        activePlayer = .red
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

            // Check for diagonal ascending win
            for x in 0..<board.count - 3 {
                for y in 3..<board[0].count {
                    if board[x][y] == player.cell,
                        board[x + 1][y - 1] == player.cell,
                        board[x + 2][y - 2] == player.cell,
                        board[x + 3][y - 3] == player.cell {
                        return player
                    }
                }
            }

            // Check for diagonal ascending win
            for x in 0..<board.count - 3 {
                for y in 0..<board[0].count - 3 {
                    if board[x][y] == player.cell,
                        board[x + 1][y + 1] == player.cell,
                        board[x + 2][y + 2] == player.cell,
                        board[x + 3][y + 3] == player.cell {
                        return player
                    }
                }
            }
        }
        return nil
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
