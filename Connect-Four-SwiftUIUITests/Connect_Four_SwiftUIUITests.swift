//
//  Connect_Four_SwiftUIUITests.swift
//  Connect-Four-SwiftUIUITests
//
//  Created by Xaver Lohmüller on 06.07.19.
//  Copyright © 2019 Xaver Lohmüller. All rights reserved.
//

import XCTest

class Connect_Four_SwiftUIUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testRedWin() {
        let column1 = app.windows.otherElements["Column 1"].firstMatch
        let column2 = app.windows.otherElements["Column 2"].firstMatch

        column1.click()
        column2.click()
        column1.click()
        column2.click()
        column1.click()
        column2.click()
        column1.click()

        XCTAssert(app.windows.otherElements["red"].exists)
        XCTAssert(app.windows.staticTexts["won the game"].exists)
    }

    func testYellowWin() {
        let column4 = app.windows.otherElements["Column 4"].firstMatch
        let column5 = app.windows.otherElements["Column 5"].firstMatch
        let column6 = app.windows.otherElements["Column 6"].firstMatch
        let column7 = app.windows.otherElements["Column 7"].firstMatch

        column7.click()
        column6.click()
        column5.click()
        column7.click()
        column6.click()
        column4.click()
        column7.click()
        column5.click()
        column4.click()
        column6.click()
        column5.click()
        column7.click()

        XCTAssert(app.windows.otherElements["yellow"].exists)
        XCTAssert(app.windows.staticTexts["won the game"].exists)
    }
}
