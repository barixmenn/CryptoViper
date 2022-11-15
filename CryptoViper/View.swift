//
//  View.swift
//  CryptoViper
//
//  Created by Baris on 16.11.2022.
//

import Foundation
import UIKit

// Talks to -> Presenter
// Class, protocol
// View Controller

protocol AnyView {
    var presenter : AnyPresenter? {get set}
}

class CryptoView : UIViewController, AnyView {
    var presenter: AnyPresenter?
    
}
