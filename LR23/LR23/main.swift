//
//  main.swift
//  LR23
//
//  Created by Marty on 13/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation

let argv = CommandLine.arguments

guard argv.count == 2 else {
    throw TranslatorError.incorrectNumberOfArguments
}


let fileName = argv[1]
let exitString = "..."


var dictionary = readDictionaryFromFile(fileName)
var dictionaryWasChanged = false


while true {
    guard let word = readLine() else {
        throw TranslatorError.errorWithConsoleReading
    }
    
    if word == exitString {
        break
    }
    
    if let translation = dictionary[word] {
        print(translation)
    } else if let translation = getNewTranslationByWord(word) {
        dictionary[word] = translation
        dictionaryWasChanged = true
    }
}

if dictionaryWasChanged && getPermissionToChangeDictionary() {
    writeIntoFileDictionary(dictionary, byFileName: fileName)
}


