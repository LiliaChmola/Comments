//
//  PaginationService.swift
//  Comments
//
//  Created by Chmola Lilia on 1/5/20.
//  Copyright © 2020 Lilia Chmola. All rights reserved.
//

import Foundation

struct PaginationService {
    let start: Int
    let end: Int
    var currentStart: Int
    var currentEnd: Int
    var isAllUploaded = false
    
    init(start: Int, end: Int) {
        self.start = start
        self.end = end
        self.currentStart = start
        if self.currentStart + 10 < self.end {
            self.currentEnd = self.currentStart + 9
        } else {
            self.currentEnd = self.end
        }
    }
    
    mutating func updateCurrentValue() {
        currentStart += 10
        if currentStart + 10 < end {
            currentEnd += 10
        } else {
            currentEnd = end
            isAllUploaded = true
        }
    }
}
