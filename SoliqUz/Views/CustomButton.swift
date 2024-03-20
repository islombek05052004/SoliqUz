//
//  CustomButton.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 02/03/24.
//

import UIKit


class CustomButton: UIButton {
    
    init(
        titleText: String?,
        subTitleText: String?,
        titleColor: UIColor = .black,
        subTitleFont: UIFont? = .systemFont(ofSize: 15, weight: .regular),
        titleFont: UIFont? = .systemFont(ofSize: 18, weight: .semibold),
        backColor: UIColor = .clear,
        image: UIImage? = nil,
        imageAlignment: NSDirectionalRectEdge = .leading,
        imageTargetSize: CGSize
    ) {
        super.init(frame: .zero)
        
        let image = image?.resize(imageTargetSize)
        let imageView = UIImageView(image: image, contentMode: .scaleAspectFit)
        self.backgroundColor = backColor
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
