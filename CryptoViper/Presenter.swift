//
//  Presenter.swift
//  CryptoViper
//
//  Created by Can Kanbur on 6.04.2023.
//

import Foundation

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    
    func interactorDidDownloadCrypto(results: Result<[Crypto],Error>)
}

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

class CryptoPresenter : AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(results: Result<[Crypto], Error>) {
        switch results {
        case .success(let cryptos):
            print("update")
        case .failure(let error):
        print("error")
        }
    }
    
    
        
}
