//
//  HomeLocalDataManager.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 01/03/24.
//

import UIKit

class HomeLocalDataManager {
    
    static let shared = HomeLocalDataManager()
    private init() {}
    
    func getHomeData() -> [[HomeCellData]] {
        
        [
            [
                HomeCellData(imageName: "mobilepayment", title: "Soliqlarni to'lash"),
                HomeCellData(imageName: "parents", title: "Ota-onam soliqlarini to'lash"),
                HomeCellData(imageName: "usb", title: "Elektron kalitga to'lov"),
                HomeCellData(imageName: "tick", title: "Jarimalarni to'lash"),
                HomeCellData(imageName: "cloud", title: "Fiksal modulga to'lov"),
            ],
            
            [
                HomeCellData(imageName: "cashback", title: "Keshbek"),
                HomeCellData(imageName: "handshake", title: "Soliq hamkor"),
                HomeCellData(imageName: "usb", title: "O'zini o'zi band qilish"),
                HomeCellData(imageName: "tax", title: "Tax Free"),
                HomeCellData(imageName: "maskcheck", title: "Maskirovkani tekshirish"),
                HomeCellData(imageName: "barcode", title: "Milliy tasnif"),
                HomeCellData(imageName: "judge", title: "Sizning soliq xizmatingiz"),
                HomeCellData(imageName: "question", title: "Ko'p so'raladigan"),
                HomeCellData(imageName: "review", title: "So'rovnoma"),
                HomeCellData(imageName: "personaldata", title: "Soliq to'lovchi ma'lumotlari"),
                HomeCellData(imageName: "checklistdoc", title: "Buyruqni tekshirish"),
                HomeCellData(imageName: "finding", title: "STIR/JShShIRni aniqlash")
            ],
            
            [
                HomeCellData(imageName: "document", title: "Soliq qarzini so'ndirish"),
                HomeCellData(imageName: "deal", title: "Ijaraga berish"),
                HomeCellData(imageName: "calculation", title: "Ortiqcha to'lovni qaytarish"),
                HomeCellData(imageName: "contract", title: "Soliq imtiyozini qaytarish"),
                HomeCellData(imageName: "solarpanel", title: "Quyoshli xonadon"),
                HomeCellData(imageName: "airplane", title: "Sayohat uchun keshbek"),
                HomeCellData(imageName: "case", title: "Ish haqi to'g'risida"),
                HomeCellData(imageName: "document", title: "Soliq qarzlari ma'lumotlari"),
                HomeCellData(imageName: "policy", title: "Rezidentlik sertifikati"),
                HomeCellData(imageName: "worker", title: "Yollanma xodim"),
                HomeCellData(imageName: "ticket", title: "Konsert tomosha"),
                HomeCellData(imageName: "sendemail", title: "Murojat yuborish")
            ],
            
            [
                HomeCellData(imageName: "personal", title: "Xodimlar uchun so'rovnoma"),
                HomeCellData(imageName: "houses", title: "Mening mahallam"),
                HomeCellData(imageName: "police", title: "Mahalla inspektori")
            ]
        ]
    }    
}
