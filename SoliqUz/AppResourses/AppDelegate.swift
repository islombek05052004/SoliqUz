//
//  AppDelegate.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: Paddings.deviceBounds)
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        setUpNavigation()
        return true
    }
}

extension AppDelegate {
    
    private func setUpNavigation() {
        let appereance = UINavigationBarAppearance()
        appereance.configureWithOpaqueBackground()
        appereance.backgroundColor = AppColors.itemColor
        
        UINavigationBar.appearance().standardAppearance = appereance
        UINavigationBar.appearance().scrollEdgeAppearance = appereance
    }
}

