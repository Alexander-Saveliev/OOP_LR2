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
    let automat = AhoAutomat()
    var expanded = ""
    var index = str.startIndex
    var lastAdded = str.startIndex
    var lastFound: Substring!
    var current: Substring!
    
    for word in words.keys {
        automat.addNewWord(word)
    }
    
    while index < str.endIndex {
        automat.moveNextStateWithChar(str[index])
        
        if let word = automat.word {
            let startIndex = str.index(index, offsetBy: -word.count + 1)
            
            lastFound = current
            current   = Substring(startIndex: startIndex, endIndex: index, word: word)
            
            if lastFound != nil, lastFound.startIndex != current.startIndex {
                expanded.append(String(str[lastAdded..<lastFound.startIndex]))
                expanded.append(words[lastFound.word]!)
                
                index     = lastFound.endIndex
                lastAdded = str.index(after: index)
                automat.reset()
                
                current = nil
            }
        }
        
        index = str.index(after: index)
    }
    
    if current != nil {
        expanded.append(String(str[lastAdded..<current.startIndex]))
        expanded.append(words[current.word]!)
        expanded.append(String(str[str.index(after: current.endIndex)..<str.endIndex]))
    } else {
        expanded.append(String(str[lastAdded..<str.endIndex]))
    }
    
    return expanded
}
