//
//  Store.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-21.
//

import Foundation

//** Identifiable: Indica que cada intancia tiene un id unico para referirte a ellas facilmente **//

//** Hashable: Esto es útil cuando necesitas almacenar instancias de tu estructura en colecciones y quieres poder buscarlas rápidamente utilizando su valor hash único. **//

struct Store: Codable, Identifiable, Hashable {
    var id: Int?
    var store: String
    var target: Int
    var sell: Int
    var lastWeek: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case store = "store"
        case target = "target"
        case sell = "sell"
        case lastWeek = "last_week"
    }
    
}
