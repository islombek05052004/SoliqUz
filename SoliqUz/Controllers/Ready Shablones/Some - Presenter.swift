//
//  Some - Presenter.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 02/03/24.
//

import UIKit

protocol SomeVCPresentable: AnyObject {
    
    var view: SomeVCHomeView! { get set }
    var viewController: SomeViewController! { get set }
    
}

final class SomeVCPresenter: SomeVCPresentable {
    
    weak var view: SomeVCHomeView!
    weak var viewController: SomeViewController!
    
}
