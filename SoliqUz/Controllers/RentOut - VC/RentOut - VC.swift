//
//  RentOutViewController.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 02/03/24.
//

import UIKit

class RentOutViewController: UIViewController {

    private let mainView = RentOutVCHomeView()
    private var presenter: RentOutVCPresentable
    
    init() {
        self.presenter = RentOutVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        self.view = mainView
        setUpBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
