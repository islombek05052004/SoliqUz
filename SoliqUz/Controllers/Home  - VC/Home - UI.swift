//
//  Home - UI.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

enum HomeTopBtnsType: Int, CaseIterable {
    
    case cashback = 0
    case plasticCard = 1
    case appeals = 2
}

final class HomeVCHomeView: UIView {
    
    private let mainScrollView = UIScrollView()
    private let topView = UIView()
    private let childView = ChildView()
    
    private let topViewMainStackView = UIStackView(
        arrangedSubviews: [],
        axis: .vertical,
        spacing: 10
    )
    
    lazy var customCollectioView: UICollectionView = {
       
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: createLayout())
        
        collectionView.register(HomeCollectionCell.self,forCellWithReuseIdentifier: HomeCollectionCell.identifier)
        
        collectionView.register(
            HomeCollectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeCollectionHeaderView.identifier)
        
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private let calculateBtnImage = UIImage(named: "cashback")?.resize(HomeVCFonts.topBtnImageSize).withRenderingMode(.alwaysTemplate)
    
    private let plasticCardBtnImage = UIImage(named:
    "creditcards")?.resize(HomeVCFonts.topBtnImageSize).withRenderingMode(.alwaysTemplate)
    
    private let appealsBtnImage = UIImage(named: "handshake")?.resize(HomeVCFonts.topBtnImageSize).withRenderingMode(.alwaysTemplate)
            
    let calculateBtn = UIButton()
    let plasticCardBtn = UIButton()
    let appealsBtn = UIButton()
    
    private var formattingBtnArr: [UIButton] = []
    
    private let calculateSummBtn = UIButton()
    private let paidSummBtn = UIButton()
    private let approvedSummBtn = UILabel()
    
    private let approvedTitleLabel = UILabel(text: "To'lovga tasdiqlangan",
                                             textColor: AppColors.green,
                                             font: HomeVCFonts.mainTitleFont)
    
    private let paidTitleLabel = UILabel(text: "To'langan",
                                         textColor: AppColors.orange,
                                         font: HomeVCFonts.mainTitleFont)
    
    private let calculatedTitleLabel =  UILabel(text: "Hisoblangan",
                                                textColor: .white,
                                                font: HomeVCFonts.mainTitleFont)
    
    private let approvedLabel = UILabel(text: "111 427",
                                        textColor: AppColors.green,
                                        font: HomeVCFonts.summFont)
    
    private let paidLabel = UILabel(text: "76 284",
                                    textColor: AppColors.orange,
                                    font: HomeVCFonts.summFont)
    
    private let calculatedLabel =  UILabel(text: "134 962",
                                           textColor: .white,
                                           font: HomeVCFonts.mainSummFont)
    
    private let cashbackLabel = UILabel(text: "Keshbek",
                                        textColor: .white,
                                        textAlignment: .center)
    
    private let partnerLabel = UILabel(text: "Soliq hamkor",
                                       textColor: .white)

    
    private let cashbackStackView = UIStackView(arrangedSubviews: [],
                                                axis: .vertical,
                                                spacing: 12)
    
    private let plasticCardStackView = UIStackView(arrangedSubviews: [],
                                                   axis: .horizontal,
                                                   spacing: 10,
                                                   contentInsets: .init(top: 10, left: 10, bottom: 10, right: 10))

    private let appealsStackView = UIStackView(arrangedSubviews: [],
                                               axis: .vertical,
                                               spacing: 10)
    
    private let plasticCardNumLabel = UILabel(text: "5614***2874",
                                              textColor: .white)
    
    private let userNameLabel = UILabel(text: "Abdurazzoqov Islombek",
                                        textColor: .white,
                                        font: .systemFont(ofSize: 20, weight: .regular))
    
    private let plasticCardImageView = UIImageView(image: UIImage(named: "creditcards"),
                                                   contentMode: .scaleAspectFit)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        formattingBtnArr = [calculateBtn, plasticCardBtn, appealsBtn]

        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeVCHomeView {
    
    private func toFormUIElements() {
        toFormElements()
        toFormTopChildView()
        currentBtn(btnTag: 0)
        toFormTopStackViews()
    }
    
    private func toFormTopChildView() {
        
        let topViewButtonStackView = UIStackView(
            arrangedSubviews: formattingBtnArr,
            axis: .horizontal,
            spacing: 20,
            contentInsets: .init(top: 0, left: 20, bottom: 0, right: 20)
        )

        topViewButtonStackView.distribution = .equalCentering
        topViewButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        childView.backgroundColor = AppColors.backColor
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        for index in 0..<formattingBtnArr.count {
            
            formattingBtnArr[index].backgroundColor = AppColors.backColor
            formattingBtnArr[index].widhtHeight(80, 80)
            formattingBtnArr[index].layer.cornerRadius = 40
            formattingBtnArr[index].tintColor = .white
            formattingBtnArr[index].translatesAutoresizingMaskIntoConstraints = false
            formattingBtnArr[index].setShadow(0, 0, AppColors.itemColor.cgColor, 0.8, 8)
            formattingBtnArr[index].tag = index
            
            var btnImage: UIImage?
            
            switch index {
            case 0: btnImage = calculateBtnImage
            case 1: btnImage = plasticCardBtnImage
            case 2: btnImage = appealsBtnImage
            default: break
            }
            
            formattingBtnArr[index].setImage(btnImage, for: .normal)
        }
        
        topView.addSubview(childView)
        topView.addSubview(topViewButtonStackView)
        
        childView.leadingAnchor(topView.leadingAnchor, 0)
        childView.trailingAnchor(topView.trailingAnchor, 0)
        childView.topAnchor(topView.topAnchor, 0)
        childView.bottomAnchor(topView.bottomAnchor, -40)

        topViewButtonStackView.centerYAnchor(childView.bottomAnchor, 0)
        topViewButtonStackView.leadingAnchor(topView.leadingAnchor, 20)
        topViewButtonStackView.trailingAnchor(topView.trailingAnchor, -20)
    }
    
    private func currentBtn(btnTag: Int) {
        for index in formattingBtnArr.indices {
            let selected = (index == tag)
            changeColorSelectedBtn(btn: formattingBtnArr[index], selected: selected)
        }
        
        if btnTag == 0 {
            
            self.plasticCardStackView.isHidden = true
            self.cashbackStackView.isHidden = false
        } else {
            self.plasticCardStackView.isHidden = false
            self.cashbackStackView.isHidden = true
        }
    }
    
    func changeColorSelectedBtn(btn: UIButton, selected: Bool) {
        
        btn.tintColor = selected ? .black : .white
        btn.backgroundColor = selected ? .white : AppColors.itemColor
    }
    
    private func toFormElements() {
        
        backgroundColor = AppColors.backColor
                
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.setShadow(0, 4, UIColor.lightGray.cgColor, 0.5, 2)
        topView.backgroundColor = .clear
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        customCollectioView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainScrollView)
        mainScrollView.addSubview(topView)
        mainScrollView.addSubview(customCollectioView)
        
        mainScrollView.leadingAnchor(leadingAnchor, 0)
        mainScrollView.topAnchor(topAnchor, 0)
        mainScrollView.bottomAnchor(safeAreaLayoutGuide.bottomAnchor, 0)
        mainScrollView.widthAnchor(width: Paddings.deviceBounds.width)
        
        topView.topAnchor(mainScrollView.topAnchor, 0)
        topView.leadingAnchor(mainScrollView.leadingAnchor, 0)
        topView.widthAnchor(width: Paddings.deviceBounds.width)
        
        customCollectioView.topAnchor(topView.bottomAnchor, 20)
        customCollectioView.leadingAnchor(mainScrollView.leadingAnchor, 10)
        customCollectioView.bottomAnchor(mainScrollView.bottomAnchor, 0)
        customCollectioView.widthAnchor(width: Paddings.deviceBounds.width - 20)
        customCollectioView.heightAnchor(height: 800)
    }
 
    private func toFormTopStackViews() {
        
        let topFirstStackView = UIStackView(
            arrangedSubviews: [calculatedTitleLabel, calculatedLabel],
            axis: .vertical,
            spacing: 5
        )
        topFirstStackView.alignment = .center

        let secondStackView = UIStackView(
            arrangedSubviews: [approvedTitleLabel, approvedLabel],
            axis: .vertical,
            spacing: 5
        )
        secondStackView.alignment = .center

        let paidStackView = UIStackView(
            arrangedSubviews: [paidTitleLabel, paidLabel],
            axis: .vertical,
            spacing: 5
        )
        paidStackView.alignment = .center
        
        let topSecondStackView = UIStackView(
            arrangedSubviews: [secondStackView, paidStackView],
            axis: .horizontal,
            spacing: 10
        )
        topSecondStackView.distribution = .fillEqually
        
        let plasticInfoStackView = UIStackView(
            arrangedSubviews: [plasticCardNumLabel, userNameLabel],
            axis: .vertical,
            spacing: 5
        )
        
        plasticCardStackView.addArrangedSubview(plasticInfoStackView)
        plasticCardStackView.addArrangedSubview(plasticCardImageView)
        plasticCardStackView.alignment = .center
        plasticCardStackView.clipsToBounds = true
        plasticCardStackView.layer.cornerRadius = 10
        plasticCardStackView.setBorder(color: AppColors.itemColor.cgColor, borderWidth: 1)
        
        plasticCardImageView.translatesAutoresizingMaskIntoConstraints = false
        plasticCardImageView.widhtHeight(50, 40)
                
        cashbackStackView.addArrangedSubview(topFirstStackView)
        cashbackStackView.addArrangedSubview(topSecondStackView)
        cashbackStackView.addArrangedSubview(cashbackLabel)

        let topMainStackView = UIStackView(
            arrangedSubviews: [cashbackStackView, plasticCardStackView],
            axis: .vertical,
            spacing: 12
        )
        
        childView.addSubview(topMainStackView)
        topMainStackView.translatesAutoresizingMaskIntoConstraints = false
        topMainStackView.topAnchor(childView.topAnchor, 10)
        topMainStackView.leadingAnchor(childView.leadingAnchor, 10)
        topMainStackView.trailingAnchor(childView.trailingAnchor, -10)
        topMainStackView.bottomAnchor(childView.bottomAnchor, -50)
    }
}

extension HomeVCHomeView {
    
    private func createLayout() -> UICollectionViewLayout {
        
        let collectionViewLayout = UICollectionViewCompositionalLayout{ (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            var section: NSCollectionLayoutSection
            
            section = self.sectionWithHeader(
                itemWidth: .fractionalWidth(1.0),
                itemheight: .fractionalHeight(1.0),
                groupWidth: .absolute(140),
                groupheight: .absolute(140),
                isGroupHorizontal: true,
                headerWidht: .absolute(Paddings.deviceBounds.width),
                headerHeight: .absolute(50),
                sectionScrollType: .continuous
            )
            return section
        }
        return collectionViewLayout
    }
}


extension HomeVCHomeView {
    
    func updateInterface(withType: HomeTopBtnsType) {
        
        switch withType {
            
        case .cashback:
            
            self.approvedTitleLabel.text = "To'lovga tasdiqlangan"
            self.calculatedTitleLabel.text = "Hisoblangan"
            self.paidTitleLabel.text = "To'langan"
            self.approvedLabel.text = "322 213"
            self.calculatedLabel.text = "321 231"
            self.paidLabel.text = "217 278"
            self.cashbackLabel.text = "Keshbek"
            self.plasticCardStackView.isHidden = true
            self.cashbackStackView.isHidden = false
            
        case .plasticCard:
    
            self.plasticCardStackView.isHidden = false
            self.cashbackStackView.isHidden = true
            
        case .appeals:
            self.approvedTitleLabel.text = "Mukofot berildi"
            self.calculatedTitleLabel.text = "Jami murojatlar"
            self.paidTitleLabel.text = "To'langan"
            self.plasticCardStackView.isHidden = true
            self.cashbackStackView.isHidden = false
            self.approvedLabel.text = "5 ta"
            self.calculatedLabel.text = "10 ta"
            self.paidLabel.text = "10 402"
            self.cashbackLabel.text = "Soliq hamkor"
        }
    }
}
