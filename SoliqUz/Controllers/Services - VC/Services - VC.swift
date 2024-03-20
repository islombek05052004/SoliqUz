//
//  ServicesViewController.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

class ServicesViewController: UIViewController {

    private let mainView = ServicesVCHomeView()
    private var presenter: ServicesVCPresentable
    
    init() {
        self.presenter = ServicesVCPresenter()
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

        setUpDelegates()
    }

    private func setUpDelegates() {
        self.mainView.customCollectioView.delegate = self
        self.mainView.customCollectioView.dataSource = self
    }
    
}

extension ServicesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
        
        self.presenter.headerView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
}
