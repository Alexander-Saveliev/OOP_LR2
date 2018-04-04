//
//  Expand Tools.swift
//  LR26
//
//  Created by Marty on 21/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//
import Foundation

func gatInputData() -> (inputFileURL: URL, outputFileURL: URL, dictionary: [String : String]) {
    let argv = CommandLine.arguments
    let argc = argv.count
    
    let inputFileURL  = URL(fileURLWithPath: FileManager.default.currentDirectoryPath + "/\(argv[1])")
    let outputFileURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath + "/\(argv[2])")
    
    var dictionary = [String : String]()
    
    for i in stride(from: 3, to: argc - 1, by: 2) {
        dictionary[argv[i]] = argv[i + 1]
    }
    
    return (inputFileURL: inputFileURL, outputFileURL: outputFileURL, dictionary: dictionary)
}


func expandTemplate(_ str: String, with words: [String : String]) -> String {
    let automat  = AhoAutomat()
    var expanded = ""
    var index        = str.startIndex
    var addNextIndex = str.startIndex
    var lastFoundWord: Substring!
    var currentWord  : Substring!
    
    for word in words.keys {
        automat.addNewWord(word)
    }
    
    while index < str.endIndex {
        automat.moveNextStateWithChar(str[index])
        
        if let word = automat.word {
            let startIndex = str.index(index, offsetBy: -word.count + 1)
            
            lastFoundWord = currentWord
            currentWord   = Substring(startIndex: startIndex, endIndex: index, word: word)
            
            if lastFoundWord != nil, lastFoundWord.startIndex != currentWord.startIndex {
                expanded.append(String(str[addNextIndex..<lastFoundWord.startIndex]))
                expanded.append(words[lastFoundWord.word]!)
                
                index     = lastFoundWord.endIndex
                addNextIndex = str.index(after: index)
                automat.reset()
                
                currentWord = nil
            }
        }
        
        index = str.index(after: index)
    }
    
    // Do we have something else in automat?
    if currentWord != nil {
        expanded.append(String(str[addNextIndex..<currentWord.startIndex]))
        expanded.append(words[currentWord.word]!)
        expanded.append(String(str[str.index(after: currentWord.endIndex)..<str.endIndex]))
    } else {
        expanded.append(String(str[addNextIndex..<str.endIndex]))
    }
    
    return expanded
}
