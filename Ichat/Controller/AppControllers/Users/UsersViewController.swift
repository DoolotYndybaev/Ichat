//
//  UsersViewController.swift
//  Ichat
//
//  Created by Doolot on 27/7/22.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserCellTableViewCell", bundle: nil), forCellReuseIdentifier: UserCellTableViewCell.reuseId)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none

    }
}
extension UsersViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCellTableViewCell.reuseId, for: indexPath) as! UserCellTableViewCell
        cell.selectionStyle = .none
        
        let cellName = names[indexPath.row]
        cell.configCell(cellName)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
