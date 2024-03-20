//
//  Account - VC.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

class AccountViewController: UIViewController {

    private let mainView = AccountVCHomeView()
    private var presenter: AccountVCPresentable
    
    init() {
        self.presenter = AccountVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        self.view = mainView
        setReadyNavigationView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
}
