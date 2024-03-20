//
//  Home - Presenter.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 01/03/24.
//
import UIKit

protocol HomeVCPresentable: AnyObject {
    
    var view: HomeVCHomeView! { get set }
    var viewController: HomeViewController! { get set }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    
    func numberOfItemsInSection(_ collectionView: UICollectionView, section: Int) -> Int
    
    func setHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    
    func cellForItemAt(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    
    func topControllBtnsTapped(with btn: UIButton)
}

final class HomeVCPresenter: HomeVCPresentable {
    
    weak var view: HomeVCHomeView!
    weak var viewController: HomeViewController!
    
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
            withReuseIdentifier: HomeCollectionCell.identifier,
            for: indexPath) as? HomeCollectionCell else { return UICollectionViewCell() }

        switch indexPath.section {
            
        case HomeVCSectionType.paymentServices.rawValue: cell.itemsColor = AppColors.green
        case HomeVCSectionType.generalServices.rawValue: cell.itemsColor = AppColors.orange
        case HomeVCSectionType.personalServices.rawValue: cell.itemsColor = .white
        case HomeVCSectionType.forEmployees.rawValue: cell.itemsColor = .purple
        default :
            break
        }
        
        let currentData = collectionViewData[indexPath.section][indexPath.row]
        cell.setDataToCell(data: currentData)
        return cell
    }
    
    func topControllBtnsTapped(with btn: UIButton) {
        
        let controllBtns = [view.calculateBtn, view.plasticCardBtn, view.appealsBtn]
        
        for index in controllBtns.indices {
            let selected = (index == btn.tag)
            view.changeColorSelectedBtn(btn: controllBtns[index], selected: selected)
        }
        
        switch btn.tag {
            
        case HomeTopBtnsType.cashback.rawValue: view.updateInterface(withType: .cashback)
        case HomeTopBtnsType.plasticCard.rawValue: view.updateInterface(withType: .plasticCard)
        case HomeTopBtnsType.appeals.rawValue: view.updateInterface(withType: .appeals)
        default: break
        }        
    }
}
