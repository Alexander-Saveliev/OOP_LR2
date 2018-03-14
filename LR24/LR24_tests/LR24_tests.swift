//
//  LR24_tests.swift
//  LR24_tests
//
//  Created by Marty on 12/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest
import Foundation

func generatePrimeNumbersSet(upperBound: Int) -> Set<Int> {
    guard upperBound >= 2 && upperBound <= 100_000_000 else {
        return []
    }
    
    
    // set of prime numbers init
    var primesSet = Array(repeatElement(false, count: upperBound + 1))
    primesSet[2] = true
    primesSet[3] = true
    
    
    // x2, y2 are i, j squared
    var x2 = 0
    var y2 = 0
    var n  = 0
    
    let sqrtUpperBound = Int(sqrt(Double(upperBound)))
    
    for i in stride(from: 1, through: sqrtUpperBound, by: 1) {
        x2 += 2 * i - 1
        y2 = 0
        for j in stride(from: 1, through: sqrtUpperBound, by: 1) {
            y2 += 2 * j - 1
            
            n = 4 * x2 + y2
            if (n <= upperBound) && (n % 12 == 1 || n % 12 == 5) {
                primesSet[n] = !primesSet[n]
            }
            
            // n = 3 * x2 + y2
            n -= x2
            if (n <= upperBound) && (n % 12 == 7) {
                primesSet[n] = !primesSet[n]
            }
            
            // n = 3 * x2 - y2
            n -= 2 * y2
            if (i > j) && (n <= upperBound) && (n % 12 == 11) {
                primesSet[n] = !primesSet[n]
            }
        }
    }
    
    
    for i in stride(from: 5, through: sqrtUpperBound, by: 1) where primesSet[i] {
        n = i * i;
        
        for j in stride(from: n, through: upperBound, by: n) {
            primesSet[j] = false
        }
    }
    
    
    
    var primes = Set<Int>()
    
    for i in stride(from: 0, through: upperBound, by: 1) where primesSet[i] {
        primes.insert(i)
    }
    
    return primes
}


class LR24_tests: XCTestCase {
    func test1() {
        let testing = generatePrimeNumbersSet(upperBound: 11)
        let answer: Set<Int>  = [2, 3, 5, 7, 11]
        XCTAssertEqual(testing, answer)
    }
    
    func test2() {
        let testing = generatePrimeNumbersSet(upperBound: 1)
        let answer: Set<Int>  = []
        XCTAssertEqual(testing, answer)
    }
    
    func test3() {
        let testing = generatePrimeNumbersSet(upperBound: -1000)
        let answer: Set<Int>  = []
        XCTAssertEqual(testing, answer)
    }
    
    func test4() {
        let testing = generatePrimeNumbersSet(upperBound: 114)
        let answer: Set<Int>  = [2, 3, 5, 7, 11, 13, 17, 19,
                                 23, 29, 31, 37, 41, 43, 47,
                                 53, 59, 61, 67, 71, 73, 79,
                                 83, 89, 97, 101, 103, 107, 109, 113]
        XCTAssertEqual(testing, answer)
    }
    
    func test5() {
        let testing = generatePrimeNumbersSet(upperBound: 100_000_001)
        let answer: Set<Int>  = []
        XCTAssertEqual(testing, answer)
    }
    
}
