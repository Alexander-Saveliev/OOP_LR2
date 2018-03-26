//
//  LR24_tests.swift
//  LR24_tests
//
//  Created by Marty on 12/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest


class LR24_tests: XCTestCase {
    func testSimpleExample() {
        let testing = generatePrimeNumbersSet(upperBound: 11)
        let answer: Set<Int>  = [2, 3, 5, 7, 11]
        XCTAssertEqual(testing, answer)
    }
    
    func testLowerBound() {
        let testing = generatePrimeNumbersSet(upperBound: 1)
        let answer: Set<Int>  = []
        XCTAssertEqual(testing, answer)
    }
    
    func testUnderLowerBound() {
        let testing = generatePrimeNumbersSet(upperBound: -1000)
        let answer: Set<Int>  = []
        XCTAssertEqual(testing, answer)
    }
    
    func testRandomMiddleValue() {
        let testing = generatePrimeNumbersSet(upperBound: 114)
        let answer: Set<Int>  = [2, 3, 5, 7, 11, 13, 17, 19,
                                 23, 29, 31, 37, 41, 43, 47,
                                 53, 59, 61, 67, 71, 73, 79,
                                 83, 89, 97, 101, 103, 107, 109, 113]
        XCTAssertEqual(testing, answer)
    }
    
    func testHigherThenUpperBound() {
        let testing = generatePrimeNumbersSet(upperBound: 100_000_001)
        let answer: Set<Int>  = []
        XCTAssertEqual(testing, answer)
    }
    
    func testUpperBound() {
        let testing = generatePrimeNumbersSet(upperBound: 100_000_000)
        XCTAssertEqual(testing.count, 5761455)
    }
}
