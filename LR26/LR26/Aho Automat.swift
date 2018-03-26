//
//  Aho Automat.swift
//  LR26
//
//  Created by Marty on 20/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

class AhoAutomat {
    private let root = BohrLeaf(char: "\0")
    private var current: BohrLeaf
    
    
    init() {
        root.suffLink = root
        current = root
    }
    
    
    public var word: String? {
        return current.isCompleted ? current.string : nil
    }
    
    
    public func moveNextStateWithChar(_ char: Character) {
        current = current.getAutoMove(char: char)
    }
    
    
    public func addNewWord(_ word: String) {
        root.addString(word)
    }
    
    
    public func reset() {
        current = root
    }
    
    
    public func char() -> Character {
        return current.char
    }
}
