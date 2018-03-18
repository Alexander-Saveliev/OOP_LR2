//
//  some_lib.swift
//  LR24
//
//  Created by Marty on 12/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation


func generatePrimeNumbersSet(upperBound: Int) -> Set<Int> {
    let upperLimit = 100_000_000
    let lowerLimit = 2
    
    guard upperBound >= lowerLimit && upperBound <= upperLimit else {
        return []
    }
    
    
    // set of prime numbers init
    var primesSet = Array(repeatElement(true, count: upperBound + 1))
    
    primesSet[0] = false
    primesSet[1] = false
    
    
    let upper = Int(sqrt(Double(upperBound)))
    
    for i in stride(from: 2, through: upper, by: 1) where primesSet[i] {
        for j in stride(from: i * i, through: upperBound, by: i) {
            primesSet[j] = false
        }
    }
    
    var primes = Set<Int>()
    
    for i in stride(from: 0, through: upperBound, by: 1) where primesSet[i] {
        primes.insert(i)
    }
    
    return primes
}


