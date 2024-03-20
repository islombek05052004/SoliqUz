//
//  HomeViewController.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    private let mainView = HomeVCHomeView()
    private var presenter: HomeVCPresentable
    
    init() {
        self.presenter = HomeVCPresenter()
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
        setDelegates()
        addTargetFunctions()
        
    }
    
    private func setDelegates() {
        
        mainView.customCollectioView.delegate = self
        mainView.customCollectioView.dataSource = self
    }
    
    private func addTargetFunctions() {
        
        mainView.appealsBtn.addTarget(
            self,
            action: #selector(topControllBtnsTapped),
            for: .touchUpInside
        )
        
        mainView.plasticCardBtn.addTarget(
            self,
            action: #selector(topControllBtnsTapped),
            for: .touchUpInside
        )
        
        mainView.calculateBtn.addTarget(
            self,
            action: #selector(topControllBtnsTapped),
            for: .touchUpInside
        )
    }
    
    @objc func topControllBtnsTapped(btn: UIButton) {
        presenter.topControllBtnsTapped(with: btn)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.presenter.numberOfSections(in: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter.numberOfItemsInSection(collectionView, section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        self.presenter.cellForItemAt(collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        self.presenter.setHeaderView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushVC(with: RentOutViewController())
    }
}
