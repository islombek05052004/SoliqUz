//
//  Monitoring - UI.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

final class MonitoringVCHomeView: UIView {
    
    let monitoringTableView = UITableView()
    
    private let mainControllBtnStackView = UIStackView(
        arrangedSubviews: [],
        axis: .horizontal,
        spacing: 5
    )
    
    private let enterMoneyLabel = UILabel(text: "Kirim",
                                          textColor: AppColors.green,
                                          font: .systemFont(ofSize: 14, weight: .semibold))
    
    private let exitMoneyLabel = UILabel(text: "Chiqim",
                                         textColor: AppColors.red,
                                         font: .systemFont(ofSize: 14, weight: .semibold))

    private let processLabel = UILabel(text: "Amallar",
                                       textColor: .white,
                                       font: .systemFont(ofSize: 14, weight: .semibold))
    
    private let enterSummMoneyLabel = UILabel(text: "0.00",
                                              textColor: AppColors.green,
                                              font: .systemFont(ofSize: 25, weight: .bold))
    
    private let exitSummMoneyLabel = UILabel(text: "0.00",
                                             textColor: AppColors.red,
                                             font: .systemFont(ofSize: 25, weight: .bold))
    
    private let processCountLabel = UILabel(text: "0",
                                            textColor: .white,
                                            font: .systemFont(ofSize: 25, weight: .bold))
    
    private let redLineView = UIView()
    private let greenLineView = UIView()
    private let whiteLineView = UIView()
    
    let enterSummBtn = UIButton()
    let exitSummBtn = UIButton()
    let processBtn = UIButton()
    
    private var selectedBtn = false
    private var selectedBtnTag = 10

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func monitoringBtnsTapped(btn: UIButton) {
                
        animationControllStackView(btnTag: btn.tag)
        selectedBtnTag = btn.tag
    }
}

extension MonitoringVCHomeView {
    
    private func toFormUIElements() {
        
        backgroundColor = AppColors.backColor
        
        let needsSubViewToStackView: [(UIView, UIView, UIView, UIView)] = [
            (enterSummMoneyLabel, enterMoneyLabel, greenLineView, enterSummBtn),
            (exitSummMoneyLabel, exitMoneyLabel, redLineView, exitSummBtn),
            (processCountLabel, processLabel, whiteLineView, processBtn)
        ]
        
        for (index, item) in needsSubViewToStackView.enumerated() {
            
            let verticalLineView = UIView()
            verticalLineView.translatesAutoresizingMaskIntoConstraints = false
            verticalLineView.backgroundColor = AppColors.backColor
            verticalLineView.widthAnchor(width: 2)
            
            let stackView = UIStackView(
                arrangedSubviews: [item.0, item.1, item.2],
                axis: .vertical,
                spacing: 4,
                contentInsets: .init(top: 10, left: 20, bottom: 10, right: 20)
            )
            stackView.alignment = .center
            
            item.2.translatesAutoresizingMaskIntoConstraints = false
            item.2.widhtHeight(100, 4)
            item.2.clipsToBounds = true
            item.2.layer.cornerRadius = 2
            item.2.isHidden = true
            
            switch index {
                
            case 0:
                item.2.backgroundColor = AppColors.green
            case 1:
                item.2.backgroundColor = AppColors.red
            case 2:
                item.2.backgroundColor = .white
            default:
                break
            }
            
            if let btn = item.3 as? UIButton {
                
                btn.tag = index
                
                stackView.addSubview(btn)
                btn.translatesAutoresizingMaskIntoConstraints = false
                btn.leadingAnchor(stackView.leadingAnchor, 0)
                btn.trailingAnchor(stackView.trailingAnchor, 0)
                btn.topAnchor(stackView.topAnchor, 0)
                btn.bottomAnchor(stackView.bottomAnchor, 0)
                btn.addTarget(self, action: #selector(monitoringBtnsTapped), for: .touchUpInside)
            }
            
            mainControllBtnStackView.addArrangedSubview(stackView)
            mainControllBtnStackView.addArrangedSubview(verticalLineView)
        }
        
        monitoringTableView.showsVerticalScrollIndicator = false
        monitoringTableView.separatorStyle = .none
        monitoringTableView.translatesAutoresizingMaskIntoConstraints = false
        monitoringTableView.backgroundColor = .clear
        monitoringTableView.register(MonitoringTableViewCell.self,
                                     forCellReuseIdentifier: MonitoringTableViewCell.identifier)
        
        mainControllBtnStackView.backgroundColor = AppColors.itemColor
        mainControllBtnStackView.clipsToBounds = true
        mainControllBtnStackView.layer.cornerRadius = 20
        mainControllBtnStackView.distribution = .equalCentering
        
        addSubview(mainControllBtnStackView)
        addSubview(monitoringTableView)
        
        mainControllBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        mainControllBtnStackView.leadingAnchor(leadingAnchor, 20)
        mainControllBtnStackView.trailingAnchor(trailingAnchor, -20)
        mainControllBtnStackView.topAnchor(safeAreaLayoutGuide.topAnchor, 20)
            
        monitoringTableView.leadingAnchor(leadingAnchor, 20)
        monitoringTableView.trailingAnchor(trailingAnchor, -20)
        monitoringTableView.topAnchor(mainControllBtnStackView.bottomAnchor, 20)
        monitoringTableView.bottomAnchor(bottomAnchor, 0)

    }
    
    private func animationControllStackView(btnTag: Int) {
        
        let subViews : [(UIView, UIView, UIView)] = [
            (enterSummMoneyLabel, enterMoneyLabel, greenLineView),
            (exitSummMoneyLabel, exitMoneyLabel, redLineView),
            (processCountLabel, processLabel, whiteLineView)
        ]
        
        for index in 0..<subViews.count {
            
            if selectedBtnTag != btnTag && !selectedBtn {
                
                if index == btnTag {
                    
                    subViews[index].0.isHidden = false
                    subViews[index].1.isHidden = false
                    subViews[index].2.isHidden = false
                    
                    UIView.animate(withDuration: 0.5) {
                        subViews[index].0.transform = .identity
                        subViews[index].2.transform = .identity
                        self.mainControllBtnStackView.distribution = .equalCentering
                    }
                    
                } else  {
                    
                    UIView.animate(withDuration: 0.5) {
                        subViews[index].0.transform = CGAffineTransform(scaleX: 0, y: 0)
                        subViews[index].2.transform = CGAffineTransform(scaleX: 0, y: 0)
                        self.mainControllBtnStackView.distribution = .equalCentering
                    }
                    
                    subViews[index].0.isHidden = true
                    subViews[index].1.isHidden = false
                    subViews[index].2.isHidden = true
                }
                
                continue
                
            } else {
                
                selectedBtn.toggle()
                selectedBtnTag = 10
                subViews[index].0.isHidden = false
                subViews[index].1.isHidden = false
                subViews[index].2.isHidden = true
                
                UIView.animate(withDuration: 0.5) {
                    subViews[index].0.transform = .identity
                    subViews[index].2.transform = .identity
                }
            }
        }
    }
}


