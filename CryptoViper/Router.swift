//
//  Router.swift
//  CryptoViper
//
//  Created by Baris on 16.11.2022.
//

import Foundation
import UIKit

// Class, Protocol
// EntryPoint

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter  {
    var entry : EntryPoint? {get}
    static func startExecution () -> AnyRouter
}

class CryptoRouter : AnyRouter {
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        var view : AnyView = CryptoView()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CrpytoInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.entry = view as? EntryPoint
 
        return router
    }
    
    
}
