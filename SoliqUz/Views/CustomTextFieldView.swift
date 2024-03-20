//
//  CustomTextFieldView.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 02/03/24.
//

import UIKit

class CustomTextFieldView : UIView {
   
   init(textField: UIView,
        leftView: UIView?,
        rightView: UIView?
   ) {
       super.init(frame: .zero)
       toFormUIElements(textField: textField, leftView: leftView, rightView: rightView)
       self.translatesAutoresizingMaskIntoConstraints = false
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}

extension CustomTextFieldView {
   
   private func toFormUIElements(
       textField: UIView,
       leftView: UIView?,
       rightView: UIView?,
       backColor: UIColor = .systemGray6
   ) {
       
       let mainStackView = UIStackView(
           arrangedSubviews: [],
           axis: .horizontal,
           spacing: 10
       )
       mainStackView.alignment = .center
       mainStackView.translatesAutoresizingMaskIntoConstraints = false
       
       if let leftView = leftView {
           leftView.translatesAutoresizingMaskIntoConstraints = false
           leftView.widhtHeight(35, 35)
           leftView.clipsToBounds = true
           leftView.backgroundColor = .systemGray5
           leftView.layer.cornerRadius = 10
           mainStackView.addArrangedSubview(leftView)
       }
       
       mainStackView.addArrangedSubview(textField)
       
       if let rightView = rightView {
           rightView.translatesAutoresizingMaskIntoConstraints = false
           rightView.widhtHeight(35, 35)
           rightView.clipsToBounds = true
           rightView.backgroundColor = .systemGray5
           rightView.layer.cornerRadius = 10
           mainStackView.addArrangedSubview(rightView)
       }
       
       addSubview(mainStackView)
       
       mainStackView.topAnchor(topAnchor, 10)
       mainStackView.bottomAnchor(bottomAnchor, -10)
       mainStackView.leadingAnchor(self.leadingAnchor, 10)
       mainStackView.trailingAnchor(self.trailingAnchor, -5)
       
       self.clipsToBounds = true
       self.backgroundColor = backColor
       self.layer.cornerRadius = 10
   }
}

