//
//  UIViewController+.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 13/01/24.
//

import UIKit

protocol UIViewControllerProtocol {
    
    func pushVC(with vc: UIViewController, animated: Bool )
    func popVC()
    func present(with vc: UIViewController)
    
}

extension UIViewController: UIViewControllerProtocol {
    
    func pushVC(with vc: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    func popVC() {
        navigationController?.popViewController(animated: true )
    }
    
    func present(with vc: UIViewController) {
        present(vc, animated: true)
    }
    
    func setUpBackButton() {

        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward"),
            style: .done,
            target: self,
            action: #selector(backTapped)
        )
        backButton.tintColor = .gray
        navigationItem.leftBarButtonItem = backButton
    }
    
    
    func setReadyNavigationView() {
        
        let nameLabel = UILabel(text: "Abdurazzoqov Islombek Alisher o'g'li",
                                textColor: .white,
                                font: .systemFont(ofSize: 20, weight: .semibold))
        let idLabel = UILabel(text: "ID: 76128521",
                              textColor: .white,
                              font: .systemFont(ofSize: 20, weight: .semibold))
        
        let navigationStackView = UIStackView(
            arrangedSubviews: [nameLabel, idLabel],
            axis: .vertical,
            spacing: 2
        )
        
        let menuBtnImage = UIImage(named: "soliqIcon")?.resize(CGSize(width: 25, height: 25)).withRenderingMode(.alwaysOriginal)
        
        let newsImage = UIImage(named: "bell")?.resize(CGSize(width: 35, height: 35))
        
        let menuNavBtn = UIBarButtonItem(image: menuBtnImage,
                                         style: .done,
                                         target: self,
                                         action: #selector(homeNavigationMenuTapped))
        
        let newsNavBtn = UIBarButtonItem(image: newsImage,
                                         style: .done,
                                         target: self,
                                         action: #selector(homeNavigationNewsTapped))
        newsNavBtn.tintColor = .white

        self.navigationItem.titleView = navigationStackView
        self.navigationItem.leftBarButtonItem = menuNavBtn
        self.navigationItem.rightBarButtonItem = newsNavBtn
    }
    
    @objc private func backTapped() { popVC() }
    
    @objc private func homeNavigationMenuTapped() {
        
    }
    
    @objc private func homeNavigationNewsTapped() {
        
        self.pushVC(with: NewsViewController())
    }
}
