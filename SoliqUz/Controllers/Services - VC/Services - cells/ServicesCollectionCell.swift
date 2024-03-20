//
//  ServicesCollectionCell.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 03/03/24.
//

import UIKit

class ServicesCollectionCell: UICollectionViewCell {
        
    static let identifier = "ServicesCollectionCell"
    
    private let imageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    
    private let titleLabel = UILabel(text: nil,
                                     textColor: .white,
                                     textAlignment: .center,
                                     font: .systemFont(ofSize: 14, weight: .regular))
    
    var backColor: UIColor? = .white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataToCell(with data: HomeCellData) {
        
        self.imageView.image = UIImage(named: data.imageName)?.withRenderingMode(.alwaysTemplate)
        
        self.titleLabel.text = data.title
        self.backgroundColor = backColor
    }
}


extension ServicesCollectionCell {
    
    private func toFormUIElements() {
        
        let mainStackView = UIStackView(
            arrangedSubviews: [imageView, titleLabel],
            axis: .vertical,
            spacing: 10,
            contentInsets: .init(top: 20, left: 10, bottom: 10, right: 10)
        )
        mainStackView.clipsToBounds = true
        mainStackView.layer.cornerRadius = 12
        mainStackView.backgroundColor = AppColors.itemColor
        mainStackView.alignment = .center
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.numberOfLines = 0
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widhtHeight(35, 35)
        imageView.tintColor = .white
        
        self.layer.cornerRadius = 12

        addSubview(mainStackView)

        mainStackView.leadingAnchor(leadingAnchor, 0)
        mainStackView.topAnchor(topAnchor, 0)
        mainStackView.trailingAnchor(trailingAnchor, -1)
        mainStackView.bottomAnchor(bottomAnchor, -1)
    }
}
