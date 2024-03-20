//
//  News - Presenter.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 03/03/24.
//


import UIKit

protocol NewsVCPresentable: AnyObject {
    
    var view: NewsVCHomeView! { get set }
    var viewController: NewsViewController! { get set }
    
    func updateInterface(with index: Int)
}

final class NewsVCPresenter: NewsVCPresentable {
    
    weak var view: NewsVCHomeView!
    weak var viewController: NewsViewController!
    
    func updateInterface(with index: Int) {
        
        self.updateInterfaceAnimation(index)
    }
    
    private func updateInterfaceAnimation(_ segmentIndex: Int) {
        if segmentIndex == 0 {
            
            UIView.animate(withDuration: 0.4) {
                self.view.newsTableView.frame.origin.x += Paddings.deviceBounds.width
                self.view.notificationsTableView.frame.origin.x += Paddings.deviceBounds.width
            }
            
        } else if segmentIndex == 1 {
            
            UIView.animate(withDuration: 0.4) {
                self.view.newsTableView.frame.origin.x -= Paddings.deviceBounds.width
                self.view.notificationsTableView.frame.origin.x -= Paddings.deviceBounds.width
            }
        }
    }
}
