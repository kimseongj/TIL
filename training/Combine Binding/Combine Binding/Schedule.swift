//
//  Schedule.swift
//  Combine Binding
//
//  Created by kimseongjun on 2023/05/23.
//

import Foundation

struct Schedule: Hashable {
    let id = UUID()
    let title: String
    let content: String
    let expirationDate: Date
    
    init(title: String = "", content: String = "", expirationDate: Date = Date()) {
        self.title = title
        self.content = content
        self.expirationDate = expirationDate
    }
}
