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

func printArray(_ array: [Double]) {
    for value in array {
        print(String(format: "%.3f", value), terminator: " ")
    }
    
    print()
}


func divArrayByHalfMax(_ array: inout [Double]?) {
    guard array != nil else {
        return
    }
    
    let halfMax: Double!
    
    if let max = array!.max() {
        halfMax = max / 2
    } else {
        array = nil
        return
    }
    
    let accuracy = 0.0005
    guard halfMax > accuracy else {
        array = nil
        return
    }
    
    for i in stride(from: 0, to: array!.count, by: 1) {
        array![i] /= halfMax
    }
}


