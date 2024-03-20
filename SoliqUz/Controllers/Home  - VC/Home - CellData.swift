//
//  Home - CellData.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 01/03/24.
//

import UIKit

enum HomeVCSectionType: Int, CaseIterable {
    
    case paymentServices = 0
    case generalServices = 1
    case personalServices = 2
    case forEmployees = 3
}

struct HomeCellData {
    
    let imageName: String
    let title: String
}



