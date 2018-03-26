//
//  main.swift
//  LR26
//
//  Created by Marty on 20/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation

var inputFileURL : URL
var outputFileURL: URL

var dictionary = [String: String]()
var inputString : String!
var outputString: String!

(inputFileURL, outputFileURL, dictionary) = gatInputData()



do {
    inputString = try String(contentsOf: inputFileURL, encoding: .utf8)
}
catch {
    print("Error: ", error)
}

outputString = expandTemplate(inputString, with: dictionary)

do {
    try outputString.write(to: outputFileURL, atomically: false, encoding: .utf8)
}
catch {
    print("Error: ", error)
}

