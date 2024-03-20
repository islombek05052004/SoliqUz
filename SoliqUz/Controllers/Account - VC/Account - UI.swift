//
//  Account - UI.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//
import UIKit


final class AccountVCHomeView: UIView {
    
    private let mainScrollView = UIScrollView()
    
    private let mainStackView = UIStackView(
        arrangedSubviews: [],
        axis: .vertical,
        spacing: 10,
        contentInsets: .init(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    private let debtLabel = UILabel(text: "Qarzdorlik",
                                    textColor: .white,
                                    textAlignment: .center,
                                    font: .systemFont(ofSize: 19, weight: .semibold))
    
    private let overPaymentLabel = UILabel(text: "Ortiqcha to'lov",
                                           textColor: .white,
                                           textAlignment: .center,
                                           font: .systemFont(ofSize: 19, weight: .semibold))
    
    private let debtSummLabel = UILabel(text: "0.00",
                                        textColor: AppColors.red,
                                        textAlignment: .center,
                                        font: .systemFont(ofSize: 20, weight: .semibold))
     
    private let overPaymentSummLabel = UILabel(text: "0.00",
                                               textColor: .white,
                                               textAlignment: .center,
                                               font: .systemFont(ofSize: 20, weight: .semibold))
    
    let payBtn = UIButton(title: "To'lov qilish",
                          textColor: .white,
                          backColor: .clear,
                          font: .systemFont(ofSize: 17, weight: .semibold),
                          textAlignment: .center)
    
    let returnBtn = UIButton(title: "Qaytarish",
                             textColor: .systemBlue,
                             backColor: .clear,
                             font: .systemFont(ofSize: 17, weight: .semibold),
                             textAlignment: .center)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountVCHomeView {
    
    private func toFormUIElements() {
        toFormMainElements()

        let needSubviewsToInfoStackView = [
            (debtLabel, debtSummLabel, payBtn),
            (overPaymentLabel, overPaymentSummLabel, returnBtn)
        ]
        
        let topInfoStackView = UIStackView(
            arrangedSubviews: [],
            axis: .horizontal,
            spacing: 20,
            contentInsets: .init(top: 10, left: 0, bottom: 10, right: 0)
        )
        
        let personalThingsStackView = UIStackView(
            arrangedSubviews: [],
            axis: .vertical,
            spacing: 10
        )
        
        topInfoStackView.distribution = .fillEqually
        
        for item in needSubviewsToInfoStackView {
            
            let nextImage = UIImage(named: "right")?.resize(CGSize(width: 15, height: 15)).withTintColor(.systemBlue)
            
            let nextImageView = UIImageView(image: nextImage, contentMode: .scaleAspectFit)
            nextImageView.translatesAutoresizingMaskIntoConstraints = false
            nextImageView.widhtHeight(30, 30)
            nextImageView.backgroundColor = .white
            nextImageView.setShadow(0, 0, UIColor.white.cgColor, 0.2, 5)
            nextImageView.tintColor = .systemBlue
            nextImageView.layer.cornerRadius = 15
            
            let summInfoStackView = UIStackView(
                arrangedSubviews: [item.1, nextImageView],
                axis: .horizontal,
                spacing: 10,
                contentInsets: .init(top: 0, left: 0, bottom: 10, right: 0)
            )
            
            let finalStackView = UIStackView(
                arrangedSubviews: [item.0, summInfoStackView, item.2],
                axis: .vertical,
                spacing: 10,
                contentInsets: .init(top: 10, left: 10, bottom: 10, right: 10)
            )
            finalStackView.layer.cornerRadius = 20
            finalStackView.backgroundColor = AppColors.itemColor
            
            topInfoStackView.addArrangedSubview(finalStackView)
        }
        
        mainStackView.addArrangedSubview(topInfoStackView)
    }
    
    private func toFormMainElements() {
        
        backgroundColor = AppColors.backColor

        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.showsVerticalScrollIndicator = false
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.backgroundColor = .clear

        addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        
        mainScrollView.leadingAnchor(leadingAnchor, 0)
        mainScrollView.topAnchor(safeAreaLayoutGuide.topAnchor, 0)
        mainScrollView.widthAnchor(width: Paddings.deviceBounds.width)
        mainScrollView.bottomAnchor(safeAreaLayoutGuide.bottomAnchor, 0)
        
        mainStackView.topAnchor(mainScrollView.topAnchor, 0)
        mainStackView.leadingAnchor(mainScrollView.leadingAnchor, 0)
        mainStackView.bottomAnchor(mainScrollView.bottomAnchor, 0)
        mainStackView.widthAnchor(width: Paddings.deviceBounds.width)

    }
}
