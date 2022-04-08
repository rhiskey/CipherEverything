//
//  TeamTableViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 03.04.2022.
//

import UIKit

class TeamTableViewController: UITableViewController {
    
    // MARK: - Public Properties
    var dataManager: DataManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isScrollEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = "Team"
    }
    
    // MARK: - TableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataManager.getTeamMembers().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "developerCell", for: indexPath) as? DeveloperTableViewCell else {
                return tableView.dequeueReusableCell(withIdentifier: "developerCell", for: indexPath) }
        cell.forceChanges(teamMember: dataManager.getTeamMembers()[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
