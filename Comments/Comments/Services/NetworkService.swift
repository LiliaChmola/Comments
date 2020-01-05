//
//  NetworkService.swift
//  Comments
//
//  Created by Chmola Lilia on 1/4/20.
//  Copyright © 2020 Lilia Chmola. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkService {    
    func getComments(start: Int, end: Int, completion: @escaping ([Comment]) -> Void) {
        var comments = [Comment]()
        
        Alamofire.request("https://jsonplaceholder.typicode.com/comments?_start=\(start - 1)&_end=\(end)").responseJSON { (response) in
            if let commentsDictArray = response.result.value as? [[String: Any]] {
                for commentDict in commentsDictArray {
                    if let comment = Comment.init(fromDict: commentDict) {
                        comments.append(comment)
                    }
                }
            }
            completion(comments)
        }
    }
}
