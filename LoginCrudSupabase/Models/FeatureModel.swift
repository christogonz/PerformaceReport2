//
//  FeatureModel.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-21.
//

import Foundation

struct Feature: Codable, Identifiable, Hashable {
    var id: Int?
    var createAt: Date
    var text: String
    var isComplete: Bool
    var userID: UUID
    
    enum CodingKeys: String, CodingKey {
        case id, text
        case createAt = "created_at"
        case isComplete = "is_complete"
        case userID = "user_id"
    }
}
