//
//  TabBarViewController.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 29/02/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let tabbarItemSize = CGSize(width: 30, height: 30)

    override func viewDidLoad() {
        
        let homeNavVC = UINavigationController(rootViewController: HomeViewController())
        
        let accountNavVC = UINavigationController(rootViewController: AccountViewController())
        
        let cameraNavVC = UINavigationController(rootViewController: CameraViewController())
        
        let monitoringNavVC = UINavigationController(rootViewController: MonitoringViewController())
        
        let servicesNavVC = UINavigationController(rootViewController: ServicesViewController())

        let homeImage = UIImage(named: "home")?.resize(tabbarItemSize)
        
        let homeImageSelected = UIImage(named: "homefill")?.resize(tabbarItemSize)
        
        let accountImage = UIImage(named: "person")?.resize(tabbarItemSize)
        
        let accountImageSelected = UIImage(named: "personfill")?.resize(tabbarItemSize)

        let cameraImage = UIImage(named: "rectangle")?.resize(tabbarItemSize)
        
        let cameraImageSelected = UIImage(named: "rectanglefill")?.resize(tabbarItemSize)

        let monitoringImage = UIImage(named: "graph")?.resize(tabbarItemSize)

        let monitoringImageSelected = UIImage(named: "graphfill")?.resize(tabbarItemSize)

        let moreImage = UIImage(named: "more")?.resize(tabbarItemSize)
        
        let moreImageSelected = UIImage(named: "morefill")?.resize(tabbarItemSize)
        
        homeNavVC.tabBarItem = UITabBarItem(title: "Asosiy",
                                            image: homeImage,
                                            selectedImage: homeImageSelected)
        
        accountNavVC.tabBarItem = UITabBarItem(title: "Kabinet",
                                               image: accountImage,
                                               selectedImage: accountImageSelected)

        
        cameraNavVC.tabBarItem = UITabBarItem(title: nil,
                                              image: cameraImage,
                                              selectedImage: cameraImageSelected)
        
        monitoringNavVC.tabBarItem = UITabBarItem(title: "Monitoring",
                                                  image: monitoringImage,
                                                  selectedImage: monitoringImageSelected)
        
        servicesNavVC.tabBarItem = UITabBarItem(title: "Xizmatlar",
                                                image: moreImage,
                                                selectedImage: moreImageSelected)

        self.viewControllers = [homeNavVC, accountNavVC, cameraNavVC, monitoringNavVC, servicesNavVC]
        setUpSettings()
        setUpTabbarRectangle()
        
        delegate = self
    }
}

extension TabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard let barButtonView = item.value(forKey: "view") as? UIView else { return }
        
        let animationLength: TimeInterval = 0.3
        let propertyAnimator = UIViewPropertyAnimator(duration: animationLength, dampingRatio: 0.5) {
            barButtonView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }
        propertyAnimator.addAnimations({ barButtonView.transform = .identity },
                                       delayFactor: CGFloat(animationLength))
        propertyAnimator.startAnimation()
    }
}


extension TabBarController {
    
    private func setUpSettings() {
        
        let appereance = UITabBarAppearance()
        appereance.configureWithOpaqueBackground()
        appereance.backgroundColor = .clear
        appereance.stackedLayoutAppearance.normal.iconColor = .white
        appereance.stackedLayoutAppearance.selected.iconColor = .white

        appereance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 14, weight: .regular)
        ]

        appereance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 15, weight: .semibold)
        ]
        
        UITabBar.appearance().standardAppearance = appereance
    }
    
    private func setUpTabbarRectangle() {
        
        
        let roundRect = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: 0,
                                y: tabBar.bounds.height - 60,
                                width: tabBar.bounds.width,
                                height: tabBar.bounds.height + 60),
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 20, height: 20))
        
        roundRect.path = bezierPath.cgPath
        roundRect.fillColor = AppColors.itemColor.cgColor
        
        tabBar.layer.insertSublayer(roundRect, at: 0)
        tabBar.backgroundColor = .clear
        tabBar.isTranslucent = true
    }
}

