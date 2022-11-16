//
//  Presenter.swift
//  CryptoViper
//
//  Created by Baris on 16.11.2022.
//

import Foundation

// Class , protocol
// talks to -> Interactor, router, view

enum NetworkError : Error{
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var interactor : AnyInteractor? {get set}
    var router : AnyRouter? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result <[Crypto], Error>)
}

class CryptoPresenter: AnyPresenter {
    var view: AnyView?
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            //View Update
            view?.update(with: cryptos)
        case .failure(_):
            view?.update(with: "Try again later...")
        }
    }

}
