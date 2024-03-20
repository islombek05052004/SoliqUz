//
//  Monitoring - Cell.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 06/03/24.
//

import UIKit

protocol MonitoringCellDelegate {
    
    func hideBottomView(bottomView: UIView)
    
}

class MonitoringTableViewCell: UITableViewCell {
    
    var delegate: MonitoringCellDelegate?
    
    static let identifier = "MonitoringTableViewCell"
    
    private let dataLabel = UILabel(text: "11 yanvar 2024",
                                    textColor: .white,
                                    font: .systemFont(ofSize: 18, weight: .semibold))
    
    private let imageViewCell = UIImageView(image: nil,
                                            contentMode: .scaleAspectFit)
    
    private let paymentTypeLabel = UILabel(text: "Keshbek",
                                           textColor: .white,
                                           font: .systemFont(ofSize: 20, weight: .regular))
    
    private let dateLabel = UILabel(text: "22:44",
                                    textColor: .white,
                                    font: .systemFont(ofSize: 13, weight: .semibold))
    
    private let summLabel = UILabel(text: "+32 423.22",
                                    textColor: AppColors.green,
                                    font: .systemFont(ofSize: 20, weight: .semibold))
    
    private let moneyTypeLabel = UILabel(text: "so'm",
                                         textColor: .white,
                                         font: .systemFont(ofSize: 13, weight: .semibold))
    
    let bottmView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MonitoringTableViewCell {
    
    private func toFormUIElements() {
        
        let summStackView = UIStackView(
            arrangedSubviews: [dateLabel, summLabel, moneyTypeLabel],
            axis: .vertical,
            spacing: 4
        )
        summStackView.alignment = .trailing
        
        let mainStackView = UIStackView(
            arrangedSubviews: [imageViewCell, paymentTypeLabel, summStackView, bottmView],
            axis: .vertical,
            spacing: 10,
            contentInsets: .init(top: 15, left: 20, bottom: 15, right: 20)
        )
        
        bottmView.isHidden = true
        bottmView.translatesAutoresizingMaskIntoConstraints = false
        bottmView.backgroundColor = .red
        bottmView.heightAnchor(height: 100)
        bottmView.widthAnchor(width: 100)
        
        
        mainStackView.alignment = .center
        mainStackView.backgroundColor = AppColors.itemColor
        mainStackView.layer.cornerRadius = 10
        
        imageViewCell.image = UIImage(named: "cashback")?.resize(CGSize(width: 30, height: 30)).withRenderingMode(.alwaysTemplate)
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewCell.widhtHeight(40, 40)
        imageViewCell.layer.cornerRadius = 20
        imageViewCell.tintColor = AppColors.green
        
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(dataLabel)
        addSubview(mainStackView)
        
        dataLabel.topAnchor(topAnchor, 10)
        dataLabel.leadingAnchor(leadingAnchor, 0)
        
        mainStackView.topAnchor(dataLabel.bottomAnchor, 10)
        mainStackView.leadingAnchor(leadingAnchor, 0)
        mainStackView.trailingAnchor(trailingAnchor, 0)
        mainStackView.bottomAnchor(bottomAnchor, 0)
        
        delegate?.hideBottomView(bottomView: bottmView)
        
    }
}
