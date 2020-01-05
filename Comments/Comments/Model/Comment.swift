//
//  Comment.swift
//  Comments
//
//  Created by Chmola Lilia on 1/4/20.
//  Copyright © 2020 Lilia Chmola. All rights reserved.
//

import Foundation

struct Comment {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
    init?(fromDict dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
            let postId = dict["postId"] as? Int,
            let name = dict["name"] as? String,
            let email = dict["email"] as? String,
            let body = dict["body"] as? String else { return nil }
        
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
    }
}
