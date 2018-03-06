//
//  some_lib.swift
//  LR21
//
//  Created by Marty on 05/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//


import Foundation


func readValues() -> [Double]? {
    guard let line = readLine() else {
        return nil
    }
    
    var inputData = [Double]()
    
    for valueString in line.components(separatedBy: " ") where valueString != "" {
        if let value = Double(valueString) {
            inputData.append(value)
        } else {
            return nil
        }
    }
    
    return inputData
}


func findHalfMaxInArray(_ array: [Double]) -> Double? {
    if array.isEmpty {
        return nil
    }
    
    var max = array[0]
    
    for value in array where value > max {
        max = value
    }
    
    return max / 2
}


func divArray(_ array: inout [Double], by divider: Double) {
    let accuracy = 0.0005
    
    assert(abs(divider) > accuracy, "Division by zero")
    
    for i in stride(from: 0, to: array.count, by: 1) {
        array[i] /= divider
    }
}


func printArray(_ array: [Double]) {
    for value in array {
        print(String(format: "%.3f", value), terminator: " ")
    }
    
    print()
}


