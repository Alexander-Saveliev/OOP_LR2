//
//  main.swift
//  LR25
//
//  Created by Marty on 18/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

while let urlToParse = readLine() {
    print()
    
    if let parsedURL = parseURL(url: urlToParse) {
        print(urlToParse)
        print("HOST: \(parsedURL.host)")
        print("PORT: \(parsedURL.port)")
        print("DOC: \(parsedURL.document)")
    } else {
        print("Incorrect URL")
    }
    print()
}
