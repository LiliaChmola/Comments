//
//  Comment.swift
//  Comments
//
//  Created by Chmola Lilia on 1/4/20.
//  Copyright © 2020 Lilia Chmola. All rights reserved.
//

import Foundation

struct Comment {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init?(fromDict dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
            let userId = dict["userId"] as? Int,
            let title = dict["title"] as? String,
            let body = dict["body"] as? String else { return nil }
        
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
}
