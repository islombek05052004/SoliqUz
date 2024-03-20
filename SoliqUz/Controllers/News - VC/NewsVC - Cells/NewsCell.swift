//
//  NewsVC - Cells.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 05/03/24.
//

import UIKit

class NewsVCNewsTableCell: UITableViewCell {
    
    static let identifier = "NewsVCNewsTableCell"
    
    private let imageViewCell = UIImageView(image: UIImage(named: "biznes"),
                                            contentMode: .scaleToFill)
    
    private let informationLabel = UILabel(text: "<<Soliq>> mobil ilovasi <<Yil brendi 2022>>da!",
                                           textColor: .white,
                                           font: .systemFont(ofSize: 15, weight: .regular))
    
    private let showImageView = UIImageView(image: UIImage(systemName: "eye.fill"),
                                            contentMode: .scaleAspectFit)
    
    private let showCountLabel = UILabel(text: "267183417",
                                         textColor: .white,
                                         font: .systemFont(ofSize: 14, weight: .regular))
    
    private let dateLabel = UILabel(text: "01.02.2024 00:00",
                                    textColor: .white,
                                    font: .systemFont(ofSize: 14, weight: .regular))
    
    private let moreLabel = UILabel(text: "Batafsil",
                                    textColor: .white,
                                    textAlignment: .right,
                                    font: .systemFont(ofSize: 16, weight: .regular))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewsVCNewsTableCell {
    
    private func toFormUIElements() {
        
        backgroundColor = .clear
        
        let showStackView = UIStackView(
            arrangedSubviews: [showImageView, showCountLabel, dateLabel],
            axis: .horizontal,
            spacing: 10
        )
                
        let showMainStackView = UIStackView(
            arrangedSubviews: [showStackView, moreLabel],
            axis: .horizontal,
            spacing: 10
        )
        
        showMainStackView.distribution = .equalCentering
        
        let informationPartStackView = UIStackView(
            arrangedSubviews: [informationLabel, showMainStackView],
            axis: .vertical,
            spacing: 10,
            contentInsets: .init(top: 10, left: 10, bottom: 10, right: 10)
        )
        
        let mainStackView = UIStackView(
            arrangedSubviews: [imageViewCell, informationPartStackView],
            axis: .vertical,
            spacing: 10
        )
                
        mainStackView.clipsToBounds = true
        mainStackView.layer.cornerRadius = 20
        
        showImageView.translatesAutoresizingMaskIntoConstraints = false
        showImageView.widhtHeight(30, 20)
        showImageView.tintColor = .gray
        
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewCell.heightAnchor(height: 150)
        
        addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor(leadingAnchor, 0)
        mainStackView.trailingAnchor(trailingAnchor, 0)
        mainStackView.topAnchor(topAnchor, 10)
        mainStackView.bottomAnchor(bottomAnchor, -10)
        mainStackView.backgroundColor = AppColors.itemColor
    }
}
 
