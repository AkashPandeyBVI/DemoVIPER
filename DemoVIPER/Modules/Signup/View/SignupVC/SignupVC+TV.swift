//
//  SignupVC+TV.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 08/01/24.
//

import UIKit

//MARK: - UITableViewDelegate
extension SignupVC: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension SignupVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
