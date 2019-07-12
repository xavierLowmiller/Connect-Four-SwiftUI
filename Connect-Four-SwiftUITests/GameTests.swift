//
//  GameTests.swift
//  Connect-Four-SwiftUITests
//
//  Created by Xaver Lohmüller on 05.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import XCTest
@testable import Connect_Four_SwiftUI

class GameTests: XCTestCase {
    func testInsertingShouldInsertACellAndToggleTheActivePlayer() {
        // Given
        let game = Game(columns: 7, rows: 6)
        let initiallyActivePlayer = game.activePlayer

        // When
        game.insert(at: 2)

        // Then
        XCTAssertEqual(game.amountOfFilledCells, 1)
        XCTAssertEqual(game.board[2][5], .red)
        XCTAssertNotEqual(game.activePlayer, initiallyActivePlayer)
    }

    func testInsertingOnFullColumnsShouldBeImpossible() {
        // Given
        let game = Game(columns: 7, rows: 2)
        game.insert(at: 2)
        game.insert(at: 2)
        XCTAssertEqual(game.amountOfFilledCells, 2)
        let initiallyActivePlayer = game.activePlayer

        // When
        game.insert(at: 2)

        // Then
        XCTAssertEqual(game.amountOfFilledCells, 2)
        XCTAssertEqual(game.activePlayer, initiallyActivePlayer)
    }

    func testNonFullColumnsShouldBeSelectable() {
        // Given
        let game = Game(columns: 7, rows: 2)

        // When
        game.insert(at: 2)

        // Then
        XCTAssert(game.isColumnSelectable(2))
    }

    func testFullColumnsShouldNotBeSelectable() {
        // Given
        let game = Game(columns: 7, rows: 2)

        // When
        game.insert(at: 2)
        game.insert(at: 2)

        // Then
        XCTAssertFalse(game.isColumnSelectable(2))
    }

    /**
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     🔶🔶🔶⚪️⚪️⚪️⚪️
     🔴🔴🔴🔴⚪️⚪️⚪️
     */
    func testHorizontalWinsShouldBeRecognized() {
        // Given
        let game = Game(columns: 7, rows: 6)
        let initiallyActivePlayer = game.activePlayer

        // When
        game.insert(at: 0)
        game.insert(at: 0)
        game.insert(at: 1)
        game.insert(at: 1)
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 3)

        // Then
        XCTAssertEqual(game.winner, initiallyActivePlayer)
    }

    /**
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️⚪️⚪️⚪️⚪️⚪️🔴
     ⚪️🔶⚪️⚪️⚪️⚪️🔴
     ⚪️🔶⚪️⚪️⚪️⚪️🔴
     ⚪️🔶⚪️⚪️⚪️⚪️🔴
     */
    func testVerticalWinsShouldBeRecognized() {
        // Given
        let game = Game(columns: 7, rows: 6)
        let initiallyActivePlayer = game.activePlayer

        // When
        game.insert(at: 6)
        game.insert(at: 1)
        game.insert(at: 6)
        game.insert(at: 1)
        game.insert(at: 6)
        game.insert(at: 1)
        game.insert(at: 6)

        // Then
        XCTAssertEqual(game.winner, initiallyActivePlayer)
    }

    /**
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️⚪️⚪️⚪️🔴⚪️⚪️
     ⚪️⚪️⚪️🔴🔶⚪️⚪️
     ⚪️⚪️🔴🔶🔶⚪️⚪️
     ⚪️🔴🔶🔶🔴🔴⚪️
     */
    func testDiagonalAscendingWinsShouldBeRecognized() {
        // Given
        let game = Game(columns: 7, rows: 6)
        let initiallyActivePlayer = game.activePlayer

        // When
        game.insert(at: 1)
        game.insert(at: 2)
        game.insert(at: 2)
        game.insert(at: 3)
        game.insert(at: 4)
        game.insert(at: 3)
        game.insert(at: 3)
        game.insert(at: 4)
        game.insert(at: 5)
        game.insert(at: 4)
        game.insert(at: 4)

        // Then
        XCTAssertEqual(game.winner, initiallyActivePlayer)
    }

    /**
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️🔴⚪️⚪️⚪️⚪️⚪️
     ⚪️🔶🔴⚪️⚪️⚪️⚪️
     ⚪️🔴🔶🔴⚪️⚪️⚪️
     🔶🔴🔶🔶🔴⚪️⚪️
     */
    func testDiagonalDescendingWinsShouldBeRecognized() {
        // Given
        let game = Game(columns: 7, rows: 6)
        let initiallyActivePlayer = game.activePlayer

        // When
        game.insert(at: 4)
        game.insert(at: 3)
        game.insert(at: 3)
        game.insert(at: 2)
        game.insert(at: 1)
        game.insert(at: 2)
        game.insert(at: 1)
        game.insert(at: 1)
        game.insert(at: 2)
        game.insert(at: 0)
        game.insert(at: 1)

        // Then
        XCTAssertEqual(game.winner, initiallyActivePlayer)
    }

    /**
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️⚪️⚪️⚪️⚪️⚪️⚪️
     ⚪️🔶⚪️⚪️⚪️⚪️⚪️
     ⚪️🔶⚪️⚪️⚪️⚪️🔴
     ⚪️🔶⚪️⚪️⚪️⚪️🔴
     ⚪️🔶⚪️⚪️⚪️🔴🔴
     */
    func testYellowWinShouldAlsoBePossible() {
        // Given
        let game = Game(columns: 7, rows: 6)

        // When
        game.insert(at: 6)
        game.insert(at: 1)
        game.insert(at: 6)
        game.insert(at: 1)
        game.insert(at: 6)
        game.insert(at: 1)
        game.insert(at: 5)
        game.insert(at: 1)

        // Then
        XCTAssertEqual(game.winner, .yellow)
    }
}

private extension Game {
    var amountOfFilledCells: Int {
        return board.flatMap { $0 }.filter { $0 != .empty }.count
    }
}
