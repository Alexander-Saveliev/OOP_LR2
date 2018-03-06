//
//  main.swift
//  LR21
//
//  Created by Marty on 05/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//


enum Errors: Error {
    case incorrectInputData
    case emptyArray
}



guard var inputData = readValues() else {
    throw Errors.incorrectInputData
}

guard let halfMax = findHalfMaxInArray(inputData) else {
    throw Errors.emptyArray
}

divArray(&inputData, by: halfMax)

printArray(inputData)

printArray(inputData.sorted())


