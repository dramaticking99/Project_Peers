//
//  ChatsTableViewController.swift
//  Project_Peers
//
//  Created by Chetan Sanwariya on 04/06/24.
//

import UIKit

class ChatsTableViewController : UITableViewController {
    
    var UserArray: [ChatModel] = []
    
    override func viewDidLoad() {
        ChatAPIManager.getChats(sender_Id: "60d0fe4f5311236168a109d9") { result in
            switch result {
            case .success(let chats):
                DispatchQueue.main.async {
                    self.UserArray = chats
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
        //tableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "chatCell")
    }
    
    //MARK: - TableView DataSource Methods
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return UserArray.count }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //as! ChatCell
        cell.textLabel?.text = UserArray[indexPath.row].name
        return cell
    }
    
    
    
    //MARK: - TableView Delegate Methods
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}
