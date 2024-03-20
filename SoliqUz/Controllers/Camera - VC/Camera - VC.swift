//
//  Camera - VC.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

class CameraViewController: UIViewController {

    private let mainView = CameraVCHomeView()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
