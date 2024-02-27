//
//  UIViewController+EXT.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 26/01/2024.
//

import UIKit

extension UIViewController {
    func registerTableCells(_ classes: [UITableViewCell.Type],for tableView: UITableView) {
        for eachClass in classes {
            let nameStr = String(describing: eachClass)
            tableView.register(UINib(nibName: nameStr, bundle: nil), forCellReuseIdentifier: nameStr)
        }
    }
    
    func registerCollectionCells(_ classes: [UICollectionView.Type],for collectionView: UICollectionView) {
        for eachClass in classes {
            let nameStr = String(describing: eachClass)
            collectionView.register(UINib(nibName: nameStr, bundle: nil), forCellWithReuseIdentifier: nameStr)
        }
    }
}
