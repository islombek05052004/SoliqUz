//
//  Monitoring - VC.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

class MonitoringViewController: UIViewController {

    private let mainView = MonitoringVCHomeView()
    private var presenter: MonitoringVCPresentable
    
    init() {
        self.presenter = MonitoringVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        setUpNavigationView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setDelegates()
    }
    
    private func setDelegates() {
        
        mainView.monitoringTableView.delegate = self
        mainView.monitoringTableView.dataSource = self
    }
}

extension MonitoringViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MonitoringTableViewCell.identifier, for: indexPath) as? MonitoringTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! MonitoringTableViewCell
        
        UIView.animate(withDuration: 2) {
            cell.bottmView.isHidden = false
//            cell.bounds.size.height -= 100/
//            cell.layoutIfNeeded()

        }
//                    tableView.reloadData()

    }
}

// MARK: set up navigation view

extension MonitoringViewController {
    
    private func setUpNavigationView() {
        
        let monitoringLabel = UILabel(text: "Monitoring",
                                      textColor: .white,
                                      font: .systemFont(ofSize: 25, weight: .semibold))
        
        let settingsBtnImage = UIImage(named: "setting")?.resize(CGSize(width: 35, height: 35))
        
        let settingsNavBtn = UIBarButtonItem(image: settingsBtnImage,
                                             style: .done,
                                             target: self,
                                             action: #selector(settingsNavBtnTapped))
        settingsNavBtn.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = settingsNavBtn
        self.navigationItem.titleView = monitoringLabel
    }
    
    @objc private func settingsNavBtnTapped() {
        
    }
}
