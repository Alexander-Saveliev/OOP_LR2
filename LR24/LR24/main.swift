//
//  main.swift
//  LR24
//
//  Created by Marty on 12/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

let argv = CommandLine.arguments

guard argv.count == 2 else {
    throw PrimesError.incorrectNumberOfArguments
}

guard let upperBound = Int(argv[1]) else {
    throw PrimesError.incorrectArgument(arg: argv[1])
}

let primes = generatePrimeNumbersSet(upperBound: upperBound)

print(primes.count)


