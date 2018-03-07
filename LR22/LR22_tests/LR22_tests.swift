//
//  LR22_tests.swift
//  LR22_tests
//
//  Created by Marty on 06/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest

func htmlDecode(_ text: String) -> String {
    var encoded = ""
    
    var iterator = text.startIndex
    
    while iterator < text.endIndex {
        let char = decodeSymbolInText(text, atIndex: iterator)
        
        encoded.append(char.symbol)
        iterator = text.index(iterator, offsetBy: char.size)
    }
    
    return encoded
}


func decodeSymbolInText(_ text: String, atIndex: String.Index) -> (symbol: Character, size: Int) {
    
    func tailIsEqualToSymbol(_ symbol: String) -> Bool {
        return text[atIndex...text.index(atIndex, offsetBy: symbol.count - 1)] == symbol
    }
    
    
    let symbols: [String: Character] = [
        "&quot;": "\"",
        "&apos;": "'",
        "&lt;"  : "<",
        "&gt;"  : ">",
        "&amp;" : "&"
    ]
    
    let tailSize = text.count - atIndex.encodedOffset
    
    for symbol in symbols.keys where symbol.count <= tailSize && tailIsEqualToSymbol(symbol) {
        return (symbols[symbol]!, symbol.count)
    }
    
    return (text[atIndex], 1)
}



class LR22_tests: XCTestCase {
    
    func test1() {
        let str    = "Cat &lt;says&gt; &quot;Meow&quot;. M&amp;M&apos;s"
        let answer = "Cat <says> \"Meow\". M&M's"
        let out    = htmlDecode(str)
        XCTAssertEqual(out, answer)
    }
    
    func test2() {
        let str    = "&lt;Some&gt; &quot;string&quot;, &apos;other&apos; some &amp;string long string, &amp;but &lt;not&gt; so long string"
        let answer = "<Some> \"string\", 'other' some &string long string, &but <not> so long string"
        let out    = htmlDecode(str)
        XCTAssertEqual(out, answer)
    }
    
    func test3() {
        let str    = ""
        let answer = ""
        let out    = htmlDecode(str)
        XCTAssertEqual(out, answer)
    }
    
    func test4() {
        let str    = "&lt;"
        let answer = "<"
        let out    = htmlDecode(str)
        XCTAssertEqual(out, answer)
    }
    
    func test5() {
        let str    = "&lt ;"
        let answer = "&lt ;"
        let out    = htmlDecode(str)
        XCTAssertEqual(out, answer)
    }
    
    func test6() {
        let str    = "not html"
        let answer = "not html"
        let out    = htmlDecode(str)
        XCTAssertEqual(out, answer)
    }
}
