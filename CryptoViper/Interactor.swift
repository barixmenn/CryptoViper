//
//  Interactor.swift
//  CryptoViper
//
//  Created by Baris on 16.11.2022.
//

import Foundation

// Class, protocol
// talks to -> Presenter
// Crpyto indirme işlemi burada yapılacak.

protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    
    func downloadCryptos()
}

class CrpytoInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json") else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _ , error  in
            guard let data = data , error == nil else {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
                return
                
            }
            
            DispatchQueue.main.async {
                do{
                    let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                    self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
                }catch {
                    self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
                }
            }
        }.resume()
    }
    
}
