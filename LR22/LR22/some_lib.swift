//
//  some_lib.swift
//  LR22
//
//  Created by Marty on 05/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//


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
    
    func textAtIndexIsEqualToSymbol(_ symbol: String) -> Bool {
        return text[atIndex...text.index(atIndex, offsetBy: symbol.count - 1)] == symbol
    }
    
    
    let symbols: [String: Character] = ["&quot;": "\"", "&apos;": "'", "&lt;": "<", "&gt;": ">", "&amp;": "&"]
    
    let possibleTailSize = text.count - atIndex.encodedOffset
    
    for currentSymbol in symbols.keys where currentSymbol.count <= possibleTailSize && textAtIndexIsEqualToSymbol(currentSymbol) {
        return (symbols[currentSymbol]!, currentSymbol.count)
    }
    
    return (text[atIndex], 1)
}


