//
//  MyPageViewController.swift
//  FK Motion
//
//  Created by Fredrik Frost on 2019-05-16.
//  Copyright © 2019 SuperNova. All rights reserved.
//

import UIKit

class MyPageViewController: UITableViewController {
    var tableElementStore: TableElementStore!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableElementStore.allTableElements.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderinSection section: Int) -> String? {
        return "Leaderboard"
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "steg", for: indexPath)
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = tableElementStore.allTableElements[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = "\(item.matvarde)"
        
        print(indexPath)
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        
        tableElementStore.updateLeaderBoard()
    }

}
