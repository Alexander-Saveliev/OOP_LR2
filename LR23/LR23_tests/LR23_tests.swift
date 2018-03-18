//
//  LR23_tests.swift
//  LR23_tests
//
//  Created by Marty on 14/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest


class LR23_tests: XCTestCase {
    
    func testDictionaryWithMouesValue() {
        let dictionary = readDictionaryFromFile("dictionary.txt")
        
        XCTAssertEqual(dictionary["mouse"], "мышь")
    }
    
    func testDictionaryWithCatValue() {
        let dictionary = readDictionaryFromFile("dictionary.txt")
        
        XCTAssertEqual(dictionary["cat"], "кошка")
    }
    
    func testDictionaryWithUnknownVAlue() {
        let dictionary = readDictionaryFromFile("dictionary.txt")
        
        XCTAssertNil(dictionary["thunder"])
    }
    
}
