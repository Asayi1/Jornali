//
//  Journal.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//


import Foundation

struct Journal: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var date: Date
    var isBookmarked: Bool
    
    init(id: UUID = UUID(), title: String, content: String, date: Date = Date(), isBookmarked: Bool = false) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
        self.isBookmarked = isBookmarked
    }
}