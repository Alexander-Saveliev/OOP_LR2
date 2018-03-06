//
//  LR21_tests.swift
//  LR21_tests
//
//  Created by Marty on 06/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest



func findHalfMaxInArray(_ array: [Double]) -> Double? {
    if array.isEmpty {
        return nil
    }
    
    var max = array[0]
    
    for value in array where value > max {
        max = value
    }
    
    return max / 2
}


func divArray(_ array: inout [Double], by divider: Double) {
    let accuracy = 0.0005
    
    assert(abs(divider) > accuracy, "Division by zero")
    
    for i in stride(from: 0, to: array.count, by: 1) {
        array[i] /= divider
    }
}



class LR21_tests: XCTestCase {
    
    func testHalfMax1() {
        let input = [3.0, 2.0, 1.0]
        
        let half = findHalfMaxInArray(input)
        
        XCTAssertEqual(half, 1.5)
    }
    
    func testHalfMax2() {
        let input = [Double]()
        
        let half = findHalfMaxInArray(input)
        
        XCTAssertEqual(half, nil)
    }
    
    func testHalfMax3() {
        let input = [0.0]
        
        let half = findHalfMaxInArray(input)
        
        XCTAssertEqual(half, 0)
    }
    
    func testHalfMax4() {
        let input = [3.0, 2.0, 1.0, 7.2]
        
        let half = findHalfMaxInArray(input)
        
        XCTAssertEqual(half, 3.6)
    }
    
    func testHalfMax5() {
        let input = [0.333]
        
        let half = findHalfMaxInArray(input)
        
        XCTAssertEqual(half!, 0.167, accuracy: 0.001)
    }
    
    func testHalfMax6() {
        let input = [0.0, 1.2, 10.2, 5.6, 6.7, 1.2, 0.8]
        
        let half = findHalfMaxInArray(input)
        
        XCTAssertEqual(half, 5.1)
    }
    
    
    
    
    func testDivArray1() {
        var array = [1.0, 2.0, 3.0, 4.0, 5.0]
        let answer = [0.5, 1.0, 1.5, 2.0, 2.5]
        
        let divider = 2.0
        
        divArray(&array, by: divider)
        
        XCTAssertEqual(array, answer)
    }
    
    func testDivArray2() {
        var array = [120.0, 31.0, 22.0, 7.0, 0.0]
        let answer = [60.0, 15.5, 11.0, 3.5, 0.0]
        
        let divider = 2.0
        
        divArray(&array, by: divider)
        
        XCTAssertEqual(array, answer)
    }
    
    func testDivArray3() {
        var array = [120.0, 31.0, 22.0, 7.0, 0.0]
        let answer = [-60.0, -15.5, -11.0, -3.5, 0.0]
        
        let divider = -2.0
        
        divArray(&array, by: divider)
        
        XCTAssertEqual(array, answer)
    }
}
