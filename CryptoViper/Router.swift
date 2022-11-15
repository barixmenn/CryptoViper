//
//  Router.swift
//  CryptoViper
//
//  Created by Baris on 16.11.2022.
//

import Foundation

// Class, Protocol
// EntryPoint

protocol AnyRouter  {
    static func startExecution () -> AnyRouter
}

class CryptoRouter : AnyRouter {
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
    
    
}
