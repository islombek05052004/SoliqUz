//
//  Services - Presenter.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 03/03/24.
//


import UIKit

protocol ServicesVCPresentable: AnyObject {
    
    var view: ServicesVCHomeView! { get set }
    var viewController: ServicesViewController! { get set }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    
    func numberOfItemsInSection(_ collectionView: UICollectionView, section: Int) -> Int
    
    func setHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    
    func cellForItemAt(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    
    func headerView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    
}

final class ServicesVCPresenter: ServicesVCPresentable {
    
    weak var view: ServicesVCHomeView!
    weak var viewController: ServicesViewController!
    
    private var collectionViewData = HomeLocalDataManager.shared.getHomeData()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionViewData.count
    }
    
    func numberOfItemsInSection(_ collectionView: UICollectionView, section: Int) -> Int {
        
        return collectionViewData[section].count
    }

    func setHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HomeCollectionHeaderView.identifier,
                for: indexPath
            ) as? HomeCollectionHeaderView else { return UICollectionReusableView() }
            
            var headerText = ""
            
            switch indexPath.section {
                
            case 0: headerText = "To'lov xizmatlari"
            case 1: headerText = "Umumiy xizmatlar"
            case 2: headerText = "Personal xizmatlar"
            case 3: headerText = "Xodimlar uchun"
            default: headerText = ""
            }
            
            headerView.servicesTitleLabel.text = headerText
            
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func cellForItemAt(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ServicesCollectionCell.identifier,
            for: indexPath) as? ServicesCollectionCell else { return UICollectionViewCell() }

        switch indexPath.section {
            
        case HomeVCSectionType.paymentServices.rawValue: cell.backColor = AppColors.green
        case HomeVCSectionType.generalServices.rawValue: cell.backColor = AppColors.orange
        case HomeVCSectionType.personalServices.rawValue: cell.backColor = .white
        case HomeVCSectionType.forEmployees.rawValue: cell.backColor = .purple
        default :
            break
        }
        
        let currentData = collectionViewData[indexPath.section][indexPath.row]
        cell.setDataToCell(with: currentData)
        return cell
    }
    
    func headerView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ServicesCollectioHeaderView.identifier,
                for: indexPath
            ) as? ServicesCollectioHeaderView else { return UICollectionReusableView() }
            
            var headerText = ""
            
            switch indexPath.section {
                
            case 0: headerText = "To'lov xizmatlari"
            case 1: headerText = "Umumiy xizmatlar"
            case 2: headerText = "Personal xizmatlar"
            case 3: headerText = "Xodimlar uchun"
            default: headerText = ""
            }
            
            headerView.setTitle(headerText)
            return headerView
        }
        return UICollectionReusableView()
        
    }
    
}
