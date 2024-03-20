//
//  Services - UI.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

final class ServicesVCHomeView: UIView {
    
    lazy var customCollectioView: UICollectionView = {
       
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        collectionView.register(ServicesCollectionCell.self,forCellWithReuseIdentifier: ServicesCollectionCell.identifier)
        
        collectionView.register(
            ServicesCollectioHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ServicesCollectioHeaderView.identifier)
        
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ServicesVCHomeView {
    
    private func toFormUIElements() {
        
        backgroundColor = AppColors.backColor
        addSubview(customCollectioView)
        
        customCollectioView.translatesAutoresizingMaskIntoConstraints = false
        customCollectioView.leadingAnchor(self.leadingAnchor, 10)
        customCollectioView.trailingAnchor(trailingAnchor, -10)
        customCollectioView.topAnchor(safeAreaLayoutGuide.topAnchor, 0)
        customCollectioView.bottomAnchor(safeAreaLayoutGuide.bottomAnchor, -20)
    }    
}

extension ServicesVCHomeView {
    
    private func createLayout() -> UICollectionViewLayout {
        
        let collectionViewLayout = UICollectionViewCompositionalLayout{ (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            var section: NSCollectionLayoutSection
            
            section = self.sectionWithHeader(
                itemWidth: .fractionalWidth(0.33),
                itemheight: .fractionalHeight(1.0),
                itemContentInsets: .init(top: 10, leading: 5, bottom: 10, trailing: 5),
                groupWidth: .absolute(Paddings.deviceBounds.width - 20),
                groupheight: .absolute(150),
                
                isGroupHorizontal: false,
                headerWidht: .absolute(Paddings.deviceBounds.width - 20),
                headerHeight: .absolute(50),
                sectionScrollType: .continuous
            )
            return section
        }
        return collectionViewLayout
    }
}
