//
//  Protocol.swift
//  LR25
//
//  Created by Marty on 18/03/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

enum Protocol: String {
    case HTTP
    case HTTPS
    case FTP
    
    func defaultPort() -> Int {
        switch self {
        case .HTTP:
            return 80
        case .HTTPS:
            return 443
        case .FTP:
            return 21
        }
    }
}
