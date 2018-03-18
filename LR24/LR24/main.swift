//
//  main.swift
//  LR24
//
//  Created by Marty on 12/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

func main() {
    let argv = CommandLine.arguments
    
    guard argv.count == 2 else {
        print("Incorrect number of argumenrs")
        return
    }
    
    guard let upperBound = Int(argv[1]) else {
        print("Error with converting an argument to Int")
        return
    }
    
    let primes = generatePrimeNumbersSet(upperBound: upperBound)
    
    print(primes)
}


main()


