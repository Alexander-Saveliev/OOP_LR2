//
//  main.swift
//  LR23
//
//  Created by Marty on 13/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation

func main() {
    let argv = CommandLine.arguments
    
    guard argv.count == 2 else {
        print("Incorrect number of arguments")
        return
    }
    
    let fileName   = argv[1]
    let exitString = "..."
    
    var dictionary           = readDictionaryFromFile(fileName)
    var dictionaryWasChanged = false
    
    while true {
        guard let word = readLine() else {
            print("Error with reading from console")
            return
        }
        
        if word == exitString {
            break
        }
        
        if let translation = dictionary[word.lowercased()] {
            print(translation)
        } else if let translation = getNewTranslationByWord(word.lowercased()) {
            dictionary[word.lowercased()] = translation
            dictionaryWasChanged = true
        }
    }
    
    if dictionaryWasChanged && getPermissionToChangeDictionary() {
        writeIntoFileDictionary(dictionary, byFileName: fileName)
    }
}


main()





