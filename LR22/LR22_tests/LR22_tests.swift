//
//  LR22_tests.swift
//  LR22_tests
//
//  Created by Marty on 06/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest

class LR22_tests: XCTestCase {
    
    func test1() {
        let str  = "Cat &lt;says&gt; &quot;Meow&quot;. M&amp;M&apos;s"
        let out = "Cat <say> \"Meow\". M&M's"
    }
    
    func test2() {
        let str  = "&lt;Some&gt; &quot;string&quot;, &apos;other&apos; some &amp;string long string, &amp;but &lt;not&gt; so long string"
        let out = "<Some> \"string\", 'other' some &string long string, &but <not> so long string"
    }
    
}
