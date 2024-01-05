//
//  LoginVC+TV.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 05/01/24.
//

import UIKit

//MARK: - UITableViewDelegate
extension LoginVC: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension LoginVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
