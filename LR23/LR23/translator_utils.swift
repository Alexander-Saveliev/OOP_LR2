//
//  some_lib.swift
//  LR23
//
//  Created by Marty on 13/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//
import Foundation

func readDictionaryFromFile(_ fileName: String) -> [String: String] {
    let fileURL  = URL(fileURLWithPath: FileManager.default.currentDirectoryPath + "/\(fileName)")

    guard FileManager.default.fileExists(atPath: "\(FileManager.default.currentDirectoryPath)/\(fileName)") else {
        return [:]
    }
    
    var dictionary = [String: String]()
    
    //reading
    do {
        let input = try String(contentsOf: fileURL, encoding: .utf8)
        
        for line in input.components(separatedBy: "\n") where line != "" {
            let pair = line.components(separatedBy: "\t")
            
            if pair.count == 2 {
                dictionary[pair[0]] = pair[1]
            }
        }
    }
    catch {/* error handling here */}
    
    return dictionary
}


func writeIntoFileDictionary(_ dictionary: [String: String], byFileName: String) {
    let fileURL  = URL(fileURLWithPath: FileManager.default.currentDirectoryPath + "/\(byFileName)")
    var text = ""
    
    for (key, value) in dictionary {
        text.append("\(key)\t\(value)\n")
    }
    
    do {
        try text.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
    }
    catch {/* error handling here */}
}


func getNewTranslationByWord(_ word: String) -> String? {
    print("Неизвестное слово \"\(word)\". Введите перевод или пустую строку для отказа.")
    
    if let translation = readLine(), translation != "" {
        print("Слово \"\(word)\" сохранено в словаре как \"\(translation)\".")
        return translation
    } else {
        return nil
    }
}


func getPermissionToChangeDictionary() -> Bool {
    let acceptString = "Y"
    
    print("В словарь были внесены изменения. Введите Y или y для сохранения перед выходом.")
    if let permission = readLine(), permission.uppercased() == acceptString {
        print("Изменения сохранены. До свидания.")
        return true
    }
    
    return false
}

