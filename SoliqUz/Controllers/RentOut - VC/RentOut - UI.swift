//
//  RentOut - UI.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 02/03/24.
//

import UIKit

final class RentOutVCHomeView: UIView {
    
    private let mainScrollView = UIScrollView()
    
    private let mainStackView = UIStackView(arrangedSubviews: [],
                                            axis: .vertical,
                                            spacing: 10)
    
    let reseiverPersonBtn = UIButton()
    
    let giverPersonBtn: UIButton = {
       
        let btn = UIButton(type: .system)
        btn.setTitle("  Beruvchi shaxsning ma'lumotlari", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        btn.setImage(UIImage(systemName: "circle.fill")?.resize(CGSize(width: 30, height: 30)), for: .normal)
        
        btn.tintColor = .white
        return btn
        
    }()
    
    let informationOffPropertyBtn = UIButton()

    private let mainReseiverStackView = UIStackView(arrangedSubviews: [],
                                                    axis: .vertical,
                                                    spacing: 10)
    
    private let reseiverStackView = UIStackView(arrangedSubviews: [],
                                                axis: .horizontal,
                                                spacing: 10)
    
    private let mainGiverStackView = UIStackView(
        arrangedSubviews: [],
        axis: .vertical,
        spacing: 10,
        contentInsets: .init(top: 0, left: 10, bottom: 0, right: 0)
    )
    
    private let giverStackView = UIStackView(arrangedSubviews: [],
                                             axis: .vertical,
                                             spacing: 10)

    private let mainInformationPropertyStackView = UIStackView(arrangedSubviews: [],
                                                               axis: .vertical,
                                                               spacing: 10)
    
    private let informationPropertyStackView = UIStackView(arrangedSubviews: [],
                                                           axis: .horizontal,
                                                           spacing: 10)
    
    let giverInfoView = CustomGiverInformationView()

    var selected: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RentOutVCHomeView {
    
    private func toFormUIElements() {
        
        backgroundColor = AppColors.backColor
        toFormMainStackView()
        toFormMainGiverStackView()
        
    }
    
    private func toFormMainStackView() {
        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.addArrangedSubview(mainReseiverStackView)
        mainStackView.addArrangedSubview(mainGiverStackView)
        mainStackView.addArrangedSubview(mainInformationPropertyStackView)
        
        addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        
        mainScrollView.topAnchor(safeAreaLayoutGuide.topAnchor, 0)
        mainScrollView.leadingAnchor(leadingAnchor, 0)
        mainScrollView.bottomAnchor(safeAreaLayoutGuide.bottomAnchor, 0)
        mainScrollView.widthAnchor(width: Paddings.deviceBounds.width)
        
        mainStackView.topAnchor(mainScrollView.topAnchor, 0)
        mainStackView.leadingAnchor(mainScrollView.leadingAnchor, 0)
        mainStackView.bottomAnchor(mainScrollView.bottomAnchor, 0)
        mainStackView.widthAnchor(width: Paddings.deviceBounds.width)
    }
    
    private func toFormMainReseiverStackView() {
        
        let lineView = UIView()
        lineView.backgroundColor = .white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.widthAnchor(width: 2)
        
        let needStackView = UIStackView(
            arrangedSubviews: [lineView, reseiverStackView],
            axis: .horizontal,
            spacing: 10
        )
        
        reseiverPersonBtn.translatesAutoresizingMaskIntoConstraints = false
        reseiverPersonBtn.heightAnchor(height: 55)
        reseiverPersonBtn.titleLabel?.textAlignment = .left
        
        mainReseiverStackView.addArrangedSubview(reseiverPersonBtn)
        mainReseiverStackView.addArrangedSubview(needStackView)
        
    }
    
    private func toFormMainGiverStackView() {
        
        mainGiverStackView.alignment = .leading
        
        let lineView = UIView()
        lineView.backgroundColor = .white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.widthAnchor(width: 2)
        
        let spaceView = UIView()
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        spaceView.heightAnchor(height: 40)
        
        let needStackView = UIStackView(
            arrangedSubviews: [lineView, giverStackView],
            axis: .horizontal,
            spacing: 20,
            contentInsets: .init(top: 0, left: 15, bottom: 0, right: 20)
        )
        needStackView.distribution = .fill
        
        giverStackView.addArrangedSubview(giverInfoView)
        giverStackView.addArrangedSubview(spaceView)
        
        giverPersonBtn.translatesAutoresizingMaskIntoConstraints = false
        giverPersonBtn.heightAnchor(height: 55)
        giverPersonBtn.titleLabel?.textAlignment = .left
        giverPersonBtn.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        mainGiverStackView.addArrangedSubview(giverPersonBtn)
        mainGiverStackView.addArrangedSubview(needStackView)
        mainStackView.addArrangedSubview(mainGiverStackView)
    }
    
    @objc func tap() {
        
        if selected {
            
            UIView.animate(withDuration: 0.2) {
                self.giverInfoView.isHidden = false
            } completion: { Bool in
                UIView.animate(withDuration: 0.2) {
                    self.giverInfoView.transform = .identity
                }
            }
            
        } else {
            
            UIView.animate(withDuration: 0.2) {
                self.giverInfoView.transform = .init(translationX: Paddings.deviceBounds.width, y: 0)

            } completion: { Bool in
                UIView.animate(withDuration: 0.2) {
                    self.giverInfoView.isHidden = true
                }
            }
        }
        
        selected.toggle()
    }
}
