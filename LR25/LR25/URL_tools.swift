//
//  URL_tools.swift
//  LR25
//
//  Created by Marty on 18/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//
import Foundation

func parseURL(url: String) -> (protocol: Protocol, port: Int, host: String, document: String)? {
    let theFirstPortNumber = 1
    let theLastPortNumber  = 65_535
    
    // url
    guard let urlToParse = URL(string: url) else {
        return nil
    }
    
    // protocol
    guard let parsedProtocol = Protocol(rawValue: (urlToParse.scheme ?? "").uppercased()) else {
        return nil
    }
    
    // port
    let parsedPort = urlToParse.port ?? parsedProtocol.defaultPort()
    
    if parsedPort < theFirstPortNumber || parsedPort > theLastPortNumber {
        return nil
    }
    
    // host
    guard let parsedHost = urlToParse.host, !parsedHost.isEmpty else {
        return nil
    }
    
    //doc
    let protocolSuffixSize = 3
    let hostSuffixSize     = 1
    
    var parsedDocument = ""
    
    let docOffset = parsedProtocol.rawValue.count + protocolSuffixSize + parsedHost.count + hostSuffixSize
    
    if docOffset < url.count {
        let docLowerBound = url.index(url.startIndex, offsetBy: docOffset)
        parsedDocument    = String(url[docLowerBound..<url.endIndex])
    }

    return (protocol: parsedProtocol, port: parsedPort, host: parsedHost, document: parsedDocument)
}
