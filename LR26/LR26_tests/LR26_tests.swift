//
//  LR26_tests.swift
//  LR26_tests
//
//  Created by Marty on 21/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest

class LR26_tests: XCTestCase {
    
    // MARK: - tests from the task -
    func testFromTheTask1() {
        let str    = "Hello, %USER_NAME%. Today is {WEEK_DAY}."
        let answer = "Hello, Ivan Petrov. Today is Friday."
        
        let dictionary = [
            "%USER_NAME%"  : "Ivan Petrov",
            "{WEEK_DAY}" : "Friday"
        ]
        
        XCTAssertEqual(expandTemplate(str, with: dictionary), answer)
    }
    
    func testFromTheTask2() {
        let str    = "Hello, %USER_NAME%. Today is {WEEK_DAY}."
        let answer = "Hello, Super %USER_NAME% {WEEK_DAY}. Today is Friday. {WEEK_DAY}."
        
        let dictionary = [
            "%USER_NAME%"  : "Super %USER_NAME% {WEEK_DAY}",
            "{WEEK_DAY}" : "Friday. {WEEK_DAY}"
        ]
        
        XCTAssertEqual(expandTemplate(str, with: dictionary), answer)
    }
    
    func testFromTheTask3() {
        let str    = "-AABBCCCCCABC+"
        let answer = "-[aa][bb][cc][cc][c][a][b][c]+"
        
        let dictionary = [
            "A"  : "[a]",
            "AA" : "[aa]",
            "B"  : "[b]",
            "BB" : "[bb]",
            "C"  : "[c]",
            "CC" : "[cc]"
        ]
        
        XCTAssertEqual(expandTemplate(str, with: dictionary), answer)
    }
    
    func testEmptyString() {
        let str = ""
        let answer = ""
        
        let dictionary = [
            "A"  : "[a]",
            "AA" : "[aa]",
            "B"  : "[b]",
            "BB" : "[bb]",
            "C"  : "[c]",
            "CC" : "[cc]"
        ]
        
        XCTAssertEqual(expandTemplate(str, with: dictionary), answer)
    }
    
    func testEmptyDictionary() {
        let str = "-AABBCCCCCABC+"
        let answer = "-AABBCCCCCABC+"
        
        let dictionary = [String : String]()
        
        XCTAssertEqual(expandTemplate(str, with: dictionary), answer)
    }
    
    func testDictionaryWithEmptyElements() {
        let str = "-AABBCCCCCABCD+"
        let answer = "-[aa][bb][cc][cc][c][a][b][c]+"
        
        let dictionary = [
            "A"  : "[a]",
            "AA" : "[aa]",
            "D" : "",
            "" : "E",
            "B"  : "[b]",
            "BB" : "[bb]",
            "C"  : "[c]",
            "CC" : "[cc]"
        ]
        
        XCTAssertEqual(expandTemplate(str, with: dictionary), answer)
    }
    
    
    func testCrossingStrings() {
        let str = "ABABAB"
        let answer = "EEE"
        
        let dictionary = [
            "A" : "D",
            "AB" : "E",
            "BA" : "ED"
        ]
        
        XCTAssertEqual(expandTemplate(str, with: dictionary), answer)
    }
    
    func testGetLongString() {
        let str = "AAAAAAAAAA"
        let answer = "ABABABABCDCDCDDEABABABABCDCDCDDEABABABABCDCDCDDEABABABABCDCDCDDEABABABABCDCDCDDEABABABABCDCDCDDEABABABABCDCDCDDEABABABABCDCDCDDEABABABABCDCDCDDEABABABABCDCDCDDE"
        
        let dictionary = [
            "A" : "ABABABABCDCDCDDE"
        ]
        
        XCTAssertEqual(expandTemplate(str, with: dictionary), answer)
    }
    
}
