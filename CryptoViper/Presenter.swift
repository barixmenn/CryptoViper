//
//  Presenter.swift
//  CryptoViper
//
//  Created by Baris on 16.11.2022.
//

import Foundation

// Class , protocol
// talks to -> Interactor, router, view

protocol AnyPresenter {
    var interactor : AnyInteractor? {get set}
    var router : AnyRouter? {get set}
    var view : AnyView? {get set}
}

class CryptoPresenter: AnyPresenter {
    var interactor: AnyInteractor?
    var view: AnyView?
    var router: AnyRouter?
    

}
