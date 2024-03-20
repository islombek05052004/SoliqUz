//
//  Some - UI.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 02/03/24.
//

import UIKit

final class SomeVCHomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SomeVCHomeView {
    
    private func toFormUIElements() {
        
        backgroundColor = AppColors.backColor
        
    }
    
}
