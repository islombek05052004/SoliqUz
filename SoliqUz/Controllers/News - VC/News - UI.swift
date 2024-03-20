//
//  News - UI.swift
//  SoliqUz
//
//  Created by Abdurazzoqov Islombek on 03/03/24.
//

import UIKit

enum NewsVCTableViewType: Int, CaseIterable {
    
    case newsTable = 0
    case notificationTable = 1
}

protocol NewVCHomeViewDelegate: AnyObject {
    
    func updateInterface(index: Int)
}

final class NewsVCHomeView: UIView {
    
    private let segmentControll = UISegmentedControl()
        
    let newsTableView: UITableView = {
        
        let newsTableView = UITableView()
        newsTableView.backgroundColor = .clear
        newsTableView.separatorStyle = .none
        newsTableView.showsVerticalScrollIndicator = false
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        newsTableView.tag = NewsVCTableViewType.newsTable.rawValue
        newsTableView.register(NewsVCNewsTableCell.self,
                               forCellReuseIdentifier: NewsVCNewsTableCell.identifier)
        return newsTableView
    }()
    let notificationsTableView: UITableView = {
        
        let notificationsTableView = UITableView()
        notificationsTableView.backgroundColor = .clear
        notificationsTableView.separatorStyle = .none
        notificationsTableView.showsVerticalScrollIndicator = false
        notificationsTableView.translatesAutoresizingMaskIntoConstraints = false
        notificationsTableView.tag = NewsVCTableViewType.notificationTable.rawValue
        notificationsTableView.register(NewsVCNewsTableCell.self,
                                        forCellReuseIdentifier: NewsVCNewsTableCell.identifier)

        return notificationsTableView
    }()
    
    var delegate: NewVCHomeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        toFormUIElements()
        segmentControll.selectedSegmentIndex = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsVCHomeView {
    
    private func toFormUIElements() {
        backgroundColor = AppColors.backColor
        
        let segmentSelectedFont = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .semibold)
        ]
        
        let segmentNormalFont = [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ]
        
        segmentControll.insertSegment(withTitle: "Yangilik", at: 0, animated: true)
        segmentControll.insertSegment(withTitle: "Xabarnoma", at: 1, animated: true)
        segmentControll.selectedSegmentTintColor =  AppColors.backColor
        segmentControll.backgroundColor = AppColors.itemColor
        segmentControll.setTitleTextAttributes(segmentSelectedFont, for: .selected)
        segmentControll.setTitleTextAttributes(segmentNormalFont, for: .normal)
        segmentControll.addTarget(self, action: #selector(segmentValueChanged(segment: )), for: .valueChanged)
        segmentControll.translatesAutoresizingMaskIntoConstraints = false

        addSubview(segmentControll)
        addSubview(newsTableView)
        addSubview(notificationsTableView)
        
        segmentControll.leadingAnchor(leadingAnchor, 20)
        segmentControll.trailingAnchor(trailingAnchor, -20)
        segmentControll.topAnchor(safeAreaLayoutGuide.topAnchor, 20)
        segmentControll.heightAnchor(height: 50)
        
        newsTableView.leadingAnchor(leadingAnchor, 20)
        newsTableView.bottomAnchor(bottomAnchor, 0)
        newsTableView.topAnchor(segmentControll.bottomAnchor, 10)
        newsTableView.widthAnchor(width: Paddings.deviceBounds.width - 40)

        notificationsTableView.leadingAnchor(newsTableView.trailingAnchor, 40)
        notificationsTableView.widthAnchor(width: Paddings.deviceBounds.width - 40)
        notificationsTableView.bottomAnchor(bottomAnchor, 0)
        notificationsTableView.topAnchor(segmentControll.bottomAnchor, 10)

    }
    
    @objc private func segmentValueChanged(segment: UISegmentedControl) {
        
        self.delegate?.updateInterface(index: segment.selectedSegmentIndex)
    }
}


