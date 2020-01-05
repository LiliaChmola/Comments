//
//  CommentsViewController.swift
//  Comments
//
//  Created by Chmola Lilia on 1/4/20.
//  Copyright © 2020 Lilia Chmola. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var errorLabel: UILabel!
    var comments = [Comment]()
    
    //MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        if comments.count == 0 {
            errorLabel.isHidden = false
        }
    }
}

//MARK: - UITableViewDataSource
extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as? CommentTableViewCell else { return UITableViewCell() }
        cell.userIdLabel.text = String(comments[indexPath.row].postId)
        cell.idLabel.text = String(comments[indexPath.row].id)
        cell.bodyLabel.text = comments[indexPath.row].body
        cell.titleLabel.text = comments[indexPath.row].name
        
        return cell
    }
}
