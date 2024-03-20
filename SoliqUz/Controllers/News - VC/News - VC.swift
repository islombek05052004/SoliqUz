//
//  NewsViewController.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 03/03/24.
//

import UIKit

class NewsViewController: UIViewController {

    private let mainView = NewsVCHomeView()
    private var presenter: NewsVCPresentable
    
    private let navigationTitleLabel = UILabel(text: "Yangiliklar",
                                               textColor: .white,
                                               font: .systemFont(ofSize: 20, weight: .semibold))
    
    init() {
        self.presenter = NewsVCPresenter()
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
        navigationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.titleView = navigationTitleLabel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func setDelegates() {
        
        mainView.delegate = self
        mainView.newsTableView.delegate = self
        mainView.newsTableView.dataSource = self
        mainView.notificationsTableView.dataSource = self
        mainView.notificationsTableView.delegate = self
    }
}

extension NewsViewController: NewVCHomeViewDelegate {
    
    func updateInterface(index: Int) {
        
        navigationTitleLabel.text = (index == 0) ? "Yangiliklar" : "Xabarnoma"
        self.presenter.updateInterface(with: index)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView.tag {
            
        case NewsVCTableViewType.newsTable.rawValue: return 10
        case NewsVCTableViewType.notificationTable.rawValue: return 4
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsVCNewsTableCell.identifier, for: indexPath) as? NewsVCNewsTableCell else { return UITableViewCell()
        }
                
        cell.selectionStyle = .none
        return cell
    }
}
