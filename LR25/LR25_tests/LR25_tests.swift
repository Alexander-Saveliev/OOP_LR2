//
//  LR25_tests.swift
//  LR25_tests
//
//  Created by Marty on 18/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest

class LR25_tests: XCTestCase {
    //MARK: sample test
    func testSampleFromTask() {
        let url = "http://www.mysite.com/docs/document1.html?page=30&lang=en#title"
        let answer = (protocol: Protocol.HTTP, port: 80, host: "www.mysite.com", document: "docs/document1.html?page=30&lang=en#title")
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.protocol, answer.protocol)
        XCTAssertEqual(parsedURL.port, answer.port)
        XCTAssertEqual(parsedURL.host, answer.host)
        XCTAssertEqual(parsedURL.document, answer.document)
    }
    
    //MARK: port testing
    func testURLWithDefaultPortHTTP() {
        let url = "http://developer.apple.com/documentation/swift/1641199-readline"
        let answerPort = 80
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.port, answerPort)
    }
    
    func testURLWithDefaultPortHTTPS() {
        let url = "https://developer.apple.com/documentation/swift/1641199-readline"
        let answerPort = 443
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.port, answerPort)
    }
    
    func testURLWithDefaultPortFTP() {
        let url = "ftp://ftp.funet.fi/pub/standards/RFC/rfc959.txt"
        let answerPort = 21
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.port, answerPort)
    }
    
    func testURLWithNotDefaultPort() {
        let url = "https://developer.apple.com:92/app-store/whats-new/"
        let answerPort = 92
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.port, answerPort)
    }
    
    func testURLWithUpBoundPort() {
        let url = "https://developer.apple.com:65535/app-store/whats-new/"
        let upBoundPort = 65_535
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.port, upBoundPort)
    }
    
    func testURLWithLowBoundPort() {
        let url = "https://developer.apple.com:1/app-store/whats-new/"
        let lowBoundPort = 1
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.port, lowBoundPort)
    }
    
    func testURLWithLowerIncorrectPort() {
        let url = "https://developer.apple.com:0/app-store/whats-new/"
        let port = 0
        
        let parsedURL = parseURL(url: url)
        
        XCTAssertNil(parsedURL)
    }
    
    func testURLWithUpperIncorrectPort() {
        let url = "https://developer.apple.com:0/app-store/whats-new/"
        let port = 65_536
        
        let parsedURL = parseURL(url: url)
        
        XCTAssertNil(parsedURL)
    }
    
    //MARK: protocol testing
    func testURLWithProtocolHTTP() {
        let url = "http://developer.apple.com/app-store/whats-new/"
        let answerProtocol = Protocol.HTTP
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.protocol, answerProtocol)
    }
    
    func testURLWithProtocolHTTPS() {
        let url = "https://developer.apple.com/app-store/whats-new/"
        let answerProtocol = Protocol.HTTPS
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.protocol, answerProtocol)
    }
    
    func testURLWithProtocolFTP() {
        let url = "ftp://developer.apple.com/app-store/whats-new/"
        let answerProtocol = Protocol.FTP
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.protocol, answerProtocol)
    }
    
    func testURLWithProtocolWithoutFormating() {
        let url = "hTtPs://developer.apple.com/app-store/whats-new/"
        let answerProtocol = Protocol.HTTPS
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.protocol, answerProtocol)
    }
    
    func testURLWithIncorrectProtocol() {
        let url = "htttps://developer.apple.com/app-store/whats-new/"
        
        let parsedURL = parseURL(url: url)
        
        XCTAssertNil(parsedURL)
    }
    
    //MARK: host testing
    func testSimpleHost() {
        let url = "https://www.google.ru"
        let host = "www.google.ru"
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.host, host)
    }
    
    func testHostWithPort() {
        let url = "https://www.google.ru:10"
        let host = "www.google.ru"
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.host, host)
    }
    
    func testIncorrectHost() {
        let url = "https://"
        
        let parsedURL = parseURL(url: url)
        
        XCTAssertNil(parsedURL)
    }
    
    //MARK: documetn testing
    func testURLWithSimpleDocument() {
        let url = "https://github.com/features"
        let doc = "features"
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.document, doc)
    }
    
    func testURLWithDocumentSimularWithHost() {
        let url = "https://github.com/github"
        let doc = "github"
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.document, doc)
    }
    
    func testURLWithoutDocumentWithPrefix() {
        let url = "https://github.com/"
        let doc = ""
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.document, doc)
    }
    
    func testURLWithLongDocument() {
        let url = "https://www.facebook.com/Learn-the-Net-330002341216/"
        let doc = "Learn-the-Net-330002341216/"
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.document, doc)
    }
    
    func testURLWithEmptyDocument() {
        let url = "https://github.com"
        let doc = ""
        
        let parsedURL = parseURL(url: url)!
        
        XCTAssertEqual(parsedURL.document, doc)
    }
}
