//
//  Bohr Leaf.swift
//  LR26
//
//  Created by Marty on 20/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

class BohrLeaf {
    let char: Character
    var isCompleted = false
    var suffLink: BohrLeaf?
    var parent  : BohrLeaf?
    
    var nextLeaf  = [Character : BohrLeaf]()
    var nextState = [Character : BohrLeaf]()
    
    
    init(char: Character) {
        self.char = char
    }
    
    
    var string: String {
        var current = self
        
        var string = ""
        
        while let parent = current.parent {
            string.append(current.char)
            current = parent
        }
        
        return String(string.reversed())
    }
    
    
    func addString(_ str: String) {
        guard !str.isEmpty else {
            return
        }
        
        var currentLeaf = self
        
        for char in str {
            if let next = currentLeaf.nextLeaf[char] {
                currentLeaf = next
            } else {
                let next = BohrLeaf(char: char)
                next.parent = currentLeaf
                
                currentLeaf.nextLeaf[char] = next
                currentLeaf = next
            }
        }
        
        currentLeaf.isCompleted = true
    }
    
    
    func getSuffLink() -> BohrLeaf {
        if self.suffLink == nil {
            if self.parent == nil {
                self.suffLink = self
            } else if self.parent!.parent == nil {
                self.suffLink = self.parent
            } else {
                self.suffLink = self.parent!.getSuffLink().getAutoMove(char: self.char)
            }
        }
        
        return self.suffLink!
    }
    
    
    func getSuffFLink() -> BohrLeaf {
        if self.suffLink == nil {
            let u = self.getSuffLink()
            if u.parent == nil || u.suffLink === u.parent!.suffLink {
                self.suffLink = u
            } else {
                self.suffLink = u.isCompleted ? u : u.getSuffFLink()
            }
        }
        
        return self.suffLink!
    }
    
    
    func getAutoMove(char: Character) -> BohrLeaf {
        if self.nextState[char] == nil {
            if self.nextLeaf[char] != nil {
                self.nextState[char] = self.nextLeaf[char]
            } else {
                if self.parent == nil {
                    self.nextState[char] = self
                } else {
                    self.nextState[char] = self.getSuffFLink().getAutoMove(char: char)
                }
            }
        }
        
        return self.nextState[char]!
    }
}
