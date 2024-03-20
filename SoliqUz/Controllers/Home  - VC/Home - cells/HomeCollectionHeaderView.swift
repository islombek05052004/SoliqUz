//
//  HomeCollectionHeaderView.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 01/03/24.
//

import UIKit

final class HomeCollectionHeaderView: UICollectionReusableView {
    
    static let identifier = "HomeCollectionHeaderView"
    
    let servicesTitleLabel = UILabel(text: "",
                                     textColor: .white,
                                     font: .systemFont(ofSize: 20, weight: .semibold))
    
    let moreBtn = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        let mainStackView = UIStackView(
            arrangedSubviews: [servicesTitleLabel, moreBtn],
            axis: .horizontal,
            spacing: 10,
            contentInsets: .init(top: 10, left: 20, bottom: 10, right: 20)
        )
        
        moreBtn.setTitle("Yana", for: .normal)
        moreBtn.setTitleColor(.white, for: .normal)
        moreBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        
        mainStackView.leadingAnchor(leadingAnchor, 0)
        mainStackView.trailingAnchor(trailingAnchor, 0)
        mainStackView.topAnchor(topAnchor, 0)
        mainStackView.bottomAnchor(bottomAnchor, 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
