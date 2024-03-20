//
//  Some - VC.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 02/03/24.
//

import UIKit

class SomeViewController: UIViewController {

    private let mainView = SomeVCHomeView()
    private var presenter: SomeVCPresentable
    
    init() {
        self.presenter = SomeVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
