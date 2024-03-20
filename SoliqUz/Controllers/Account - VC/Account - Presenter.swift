//
//  Account - Presenter.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 06/03/24.
//


import UIKit

protocol AccountVCPresentable: AnyObject {
    
    var view: AccountVCHomeView! { get set }
    var viewController: AccountViewController! { get set }
    
}

final class AccountVCPresenter: AccountVCPresentable {
    
    weak var view: AccountVCHomeView!
    weak var viewController: AccountViewController!
    
}
