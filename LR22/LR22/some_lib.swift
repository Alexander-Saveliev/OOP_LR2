//
//  some_lib.swift
//  LR22
//
//  Created by Marty on 05/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//


func HtmlDecode(_ text: String) -> String {
    var encoded = ""
    
    var iterator = text.startIndex
    
    while iterator < text.endIndex {
        if text[iterator] == "&", let char = checkSpecialSynbolIn(text, atIndex: iterator.encodedOffset + 1) {
            encoded.append(char)
            iterator = text.index(iterator, offsetBy: getSizeOfCharacter(char)! + 1)
        } else {
            encoded.append(text[iterator])
            iterator = text.index(after: iterator)
        }
    }

    return encoded
}


func checkSpecialSynbolIn(_ text: String, atIndex: Int) -> Character? {
    let symbols: [String: Character] = ["quot;": "\"", "apos;": "'", "lt;": "<", "gt;": ">", "amp;": "&"]
    
    for currentSymbol in symbols.keys where atIndex + currentSymbol.count - 1 < text.count {
        if text[text.index(text.startIndex, offsetBy: atIndex)...text.index(text.startIndex, offsetBy: atIndex + currentSymbol.count - 1)] == currentSymbol {
            return symbols[currentSymbol]
        }
    }
    
    return nil
}


func getSizeOfCharacter(_ char: Character) -> Int? {
    let symbols: [Character: String] = ["\"": "quot;", "'": "apos;", "<": "lt;", ">": "gt;", "&": "amp;"]
    
    return symbols[char]?.count
}











