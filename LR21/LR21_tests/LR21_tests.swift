//
//  LR21_tests.swift
//  LR21_tests
//
//  Created by Marty on 06/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//


import XCTest


func divArrayByHalfMax(_ array: inout [Double]?) {
    let accuracy = 0.0005
    
    guard array != nil else {
        return
    }
    
    let halfMax: Double
    
    if let max = array!.max() {
        halfMax = max / 2
    } else {
        return
    }
    
    guard halfMax > accuracy else {
        array = nil
        return
    }
    
    for i in stride(from: 0, to: array!.count, by: 1) {
        array![i] /= halfMax
    }
}



class LR21_tests: XCTestCase {
    func testDivArray1() {
        var array: [Double]? = [1.0, 2.0, 2.0, 1.0, 2.0]
        let answer = [1.0, 2.0, 2.0, 1.0, 2.0]
        
        divArrayByHalfMax(&array)
        
        XCTAssertEqual(array!, answer)
    }
    
    func testDivArray2() {
        var array: [Double]? = [3.0, 3.0, 12.0, 6.0]
        let answer = [0.5, 0.5, 2.0, 1.0]
        
        divArrayByHalfMax(&array)
        
        XCTAssertEqual(array!, answer)
    }
    
    func testDivArray3() {
        var array: [Double]? = []
        
        divArrayByHalfMax(&array)
        
        XCTAssertEqual(array!, [])
    }
    
    func testDivArray4() {
        var array: [Double]? = nil
        
        divArrayByHalfMax(&array)
        
        XCTAssertNil(array)
    }
    
    func testDivArray5() {
        var array: [Double]? = [-1.0, -3.0, 0.0, -4.5]
        
        divArrayByHalfMax(&array)
        
        XCTAssertNil(array)
    }
    
    func testDivArray6() {
        var array: [Double]? = [3.0]
        let answer = [2.0]
        
        divArrayByHalfMax(&array)
        
        XCTAssertEqual(array!, answer)
    }
}


