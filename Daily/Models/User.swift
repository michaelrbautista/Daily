//
//  User.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

struct User: Codable, Identifiable, Hashable {
    var id: String
    var createdAt: String?
    
    var email: String
    var username: String
    var fullName: String
    var age: Int
    var gender: String
    
    enum CodingKeys: String, CodingKey {
        case id, email, username, age, gender
        case createdAt = "created_at"
        case fullName = "full_name"
    }
}
