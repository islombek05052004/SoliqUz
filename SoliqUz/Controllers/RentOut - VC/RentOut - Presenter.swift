//
//  RentOut - Presenter.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 02/03/24.
//

import UIKit

protocol RentOutVCPresentable: AnyObject {
    
    var view: RentOutVCHomeView! { get set }
    var viewController: RentOutViewController! { get set }
    
}

final class RentOutVCPresenter: RentOutVCPresentable {
    
    weak var view: RentOutVCHomeView!
    weak var viewController: RentOutViewController!
    
}
