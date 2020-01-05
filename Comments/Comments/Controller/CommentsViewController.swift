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
    private let networkService = NetworkService()
    var paginationService: PaginationService!
    var comments = [Comment]()
    
    //MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        networkService.getComments(start: paginationService.start, end: paginationService.currentEnd) { [weak self] (comments) in
            self?.comments = comments
            self?.tableView.reloadData()
            if comments.count == 0 {
                self?.errorLabel.isHidden = false
            }
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

//MARK: - UITableViewDelegate
extension CommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !paginationService.isAllUploaded else { return }
        if indexPath.row == comments.count - 1 {
            paginationService.updateCurrentValue()
            networkService.getComments(start: paginationService.currentStart, end: paginationService.currentEnd) { [weak self] (comments) in
                self?.comments += comments
                tableView.reloadData()
            }
        }
    }
}
