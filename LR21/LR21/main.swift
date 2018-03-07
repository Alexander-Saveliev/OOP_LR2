//
//  main.swift
//  LR21
//
//  Created by Marty on 05/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation


var inputData = readValues()

assert(inputData != nil, "incorrect input data")

divArrayByHalfMax(&inputData)

assert(inputData != nil, "can't divide array")

printArray(inputData!)
printArray((inputData!).sorted())


