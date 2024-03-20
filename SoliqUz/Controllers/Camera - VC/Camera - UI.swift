//
//  Camera - UI.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit


final class CameraVCHomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CameraVCHomeView {
    
    
    
    private func toFormUIElements() {
        
        backgroundColor = AppColors.backColor
    }
    
}
