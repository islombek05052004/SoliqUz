//
//  CustomGiverInformationView.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 02/03/24.
//

import UIKit

private let infoLabelFont: UIFont? = .systemFont(ofSize: 23, weight: .regular)
private let titleLabelFont: UIFont? = .systemFont(ofSize: 17, weight: .semibold)

class CustomGiverInformationView: UIView {
    
    private let JSHSHIRLabel = UILabel(text: "JShShIR",
                                       textColor: .white,
                                       font: titleLabelFont)
    
    private let infoJSHSHIRLabel = UILabel(text: "47321273127317",
                                           textColor: .gray,
                                           font: infoLabelFont)
    
    private let nameLabel = UILabel(text: "F.I.SH",
                                    textColor: .white,
                                    font: titleLabelFont)
    
    private let infoNameLabel = UILabel(text: "Abdurazzoqov Islombek Alisher o'g'li",
                                          textColor: .gray,
                                          font: infoLabelFont)
    
    private let regionLabel = UILabel(text: "Viloyat",
                                      textColor: .white,
                                      font: titleLabelFont)
    
    private let infoRegionLabel = UILabel(text: "Sirdaryo viloyati",
                                          textColor: .gray,
                                          font: infoLabelFont)

    private let districtLabel = UILabel(text: "Tuman",
                                        textColor: .white,
                                        font: titleLabelFont)
    
    private let infoDistrictLabel = UILabel(text: "Xovos tumani",
                                            textColor: .gray,
                                            font: infoLabelFont)

    private let addressLabel = UILabel(text: "Manzil",
                                       textColor: .white,
                                       font: titleLabelFont)
    
    private let infoAddressLabel = UILabel(text: "Xovos tumani Gulbahor mahallasi Ma'orif ko'chasi 2/4 xonadon",
                                       textColor: .gray,
                                       font: infoLabelFont)

    override init(frame: CGRect) {
        super.init(frame: frame)
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomGiverInformationView {
    
    private func toFormUIElements() {
        
        let infoJSHSHIRView = CustomTextFieldView(textField: infoJSHSHIRLabel, leftView: nil, rightView: nil)
        infoJSHSHIRView.setBorder(color: UIColor.gray.cgColor, borderWidth: 1)
        infoJSHSHIRView.backgroundColor = AppColors.itemColor
        
        let infoNameView = CustomTextFieldView(textField: infoNameLabel, leftView: nil, rightView: nil)
        infoNameView.setBorder(color: UIColor.gray.cgColor, borderWidth: 1)
        infoNameView.backgroundColor = AppColors.itemColor

        
        let infoRegionView = CustomTextFieldView(textField: infoRegionLabel, leftView: nil, rightView: nil)
        infoRegionView.setBorder(color: UIColor.gray.cgColor, borderWidth: 1)
        infoRegionView.backgroundColor = AppColors.itemColor

        
        let infoDistrictView = CustomTextFieldView(textField: infoDistrictLabel, leftView: nil, rightView: nil)
        infoDistrictView.setBorder(color: UIColor.gray.cgColor, borderWidth: 1)
        infoDistrictView.backgroundColor = AppColors.itemColor

        
        let infoAddressView = CustomTextFieldView(textField: infoAddressLabel, leftView: nil, rightView: nil)
        infoAddressView.setBorder(color: UIColor.gray.cgColor, borderWidth: 1)
        infoAddressView.backgroundColor = AppColors.itemColor

        
        let JSHSHIRStackView = UIStackView(
            arrangedSubviews: [JSHSHIRLabel, infoJSHSHIRView],
            axis: .vertical,
            spacing: 5
        )
        
        let nameStackView = UIStackView(
            arrangedSubviews: [nameLabel, infoNameView],
            axis: .vertical,
            spacing: 5
        )
        
        let regionStackView = UIStackView(
            arrangedSubviews: [regionLabel, infoRegionView],
            axis: .vertical,
            spacing: 5
        )
        
        let districtStackView = UIStackView(
            arrangedSubviews: [districtLabel, infoDistrictView],
            axis: .vertical,
            spacing: 5
        )
        
        let areaStackView = UIStackView(
            arrangedSubviews: [regionStackView, districtStackView],
            axis: .horizontal,
            spacing: 10
        )
        
        let addressStackView = UIStackView(
            arrangedSubviews: [addressLabel, infoAddressView],
            axis: .vertical,
            spacing: 5
        )
        
        let mainStackView = UIStackView(
            arrangedSubviews: [JSHSHIRStackView, nameStackView, areaStackView, addressStackView],
            axis: .vertical,
            spacing: 10
        )
        
        infoAddressLabel.numberOfLines = 0
        
        addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor(leadingAnchor, 0)
        mainStackView.trailingAnchor(trailingAnchor, 0)
        mainStackView.topAnchor(topAnchor, 0)
        mainStackView.bottomAnchor(bottomAnchor, 0)
    }
}
