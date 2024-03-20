//
//  HomeCollectionCell.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 01/03/24.
//

import UIKit

final class HomeCollectionCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionCell"
    
    private let imageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private let titleLabel = UILabel(text: nil,
                                     textColor: .white,
                                     textAlignment: .center,
                                     font: .systemFont(ofSize: 14, weight: .regular))
    private let bottomLineView = UIView()
    
    var itemsColor: UIColor = .red
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColors.itemColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.setShadow(0, 0, AppColors.itemColor.cgColor, 0.7, 7)

        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCollectionCell {
    
    private func toFormUIElements() {
        
        let mainStackView = UIStackView(
            arrangedSubviews: [imageView, titleLabel, bottomLineView],
            axis: .vertical,
            spacing: 10,
            contentInsets: .init(top: 20, left: 5, bottom: 0, right: 5)
        )
        titleLabel.numberOfLines = 2
        
        mainStackView.alignment = .center
        mainStackView.distribution = .equalCentering
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
                
        addSubview(mainStackView)
        
        mainStackView.leadingAnchor(leadingAnchor, 0)
        mainStackView.topAnchor(topAnchor, 0)
        mainStackView.trailingAnchor(trailingAnchor, 0)
        mainStackView.bottomAnchor(bottomAnchor, 0)
        
        bottomLineView.widhtHeight(80, 4)
        bottomLineView.clipsToBounds = true
        bottomLineView.layer.cornerRadius = 2
    }
    
    func setDataToCell(data: HomeCellData) {
        
        bottomLineView.backgroundColor = itemsColor

        self.imageView.image = UIImage(named: data.imageName)?.resize(CGSize(width: 40, height: 40)).withRenderingMode(.alwaysTemplate)
        self.imageView.tintColor = itemsColor
        self.titleLabel.text = data.title
    }
}
