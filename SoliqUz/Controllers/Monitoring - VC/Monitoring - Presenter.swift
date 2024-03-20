//
//  Monitoring - Presenter.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

protocol MonitoringVCPresentable: AnyObject {
    
    var view: MonitoringVCHomeView! { get set }
    var viewController: MonitoringViewController! { get set }
    
}

final class MonitoringVCPresenter: MonitoringVCPresentable {
    
    weak var view: MonitoringVCHomeView!
    weak var viewController: MonitoringViewController!
    
}
