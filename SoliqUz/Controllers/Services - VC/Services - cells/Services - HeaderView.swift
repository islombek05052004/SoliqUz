//
//  Services - HeaderView.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 03/03/24.
//

import UIKit

class ServicesCollectioHeaderView: UICollectionReusableView {
    
    static let identifier = "ServicesCollectioHeaderView"
    
    private let titleLabel = UILabel(text: "",
                                     textColor: .white,
                                     font: .systemFont(ofSize: 22, weight: .semibold))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor(centerYAnchor, 0)
        titleLabel.leadingAnchor(leadingAnchor, 0)
        titleLabel.trailingAnchor(trailingAnchor, -20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ string: String) {
        self.titleLabel.text = string
    }
}
