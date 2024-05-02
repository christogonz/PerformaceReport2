//
//  ViewModel.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-16.
//

import Foundation
import Supabase

enum Table {
    static let stores = "all_store_export"
    static let feature = "Feature"
}


@MainActor
final class ViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = UserDefaults.standard.bool(forKey: "isAuthenticated") {
        didSet {UserDefaults.standard.setValue(isAuthenticated, forKey: "isAuthenticated")}}

    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var stores = [Store]()
    @Published var features = [Feature]()
    
    var totalTargets: Int {
        stores.reduce(0) { $0 + $1.target }
    }
    var totalSold: Int {
        stores.reduce(0) {$0 + $1.sell}
    }
    
    var totalLastWeek: Int {
        stores.reduce(0) { $0 + $1.lastWeek }
    }

    var totalLeft: Int {
        stores.reduce(0) { $0 + ($1.target - $1.sell)}
    }
    
    
    var totalPercent: Int {
        let totalTarget = stores.reduce(0) {$0 + $1.target}
        let totalSold = stores.reduce(0) {$0 + $1.sell}
        
        // Verificar si totalTarget es mayor que cero para evitar división por cero
        if totalTarget > 0 {
            let percentage = (  Double(totalSold) / Double(totalTarget) ) * 100
            return Int(percentage.rounded())
        } else {
            return 0
        }
    }

    var supabase = SupabaseClient(
        supabaseURL: SecretAPI.apiURL,
        supabaseKey: SecretAPI.apiKey
    )
    
    // MARK: - Login Functions

    func signIn() async throws {
        _ = try await supabase.auth.signIn(
            email: email,
            password: password)
        isAuthenticated = true
    }

    func signOut() async throws {
        _ = try await supabase.auth.signOut()
        isAuthenticated = false
    }
    
    
    
    // MARK: - CRUD Functions
    
    func fetchStoreRequest() async throws {
        let store: [Store] = try await supabase.database
            .from(Table.stores)
            .select()
            .order("store", ascending: false)
            .execute()
            .value
        
        
        DispatchQueue.main.async {
            self.stores = store
        }
    }
    
    func fetchFeatureRequest() async throws {
        let feature: [Feature] = try await supabase.database
            .from(Table.feature)
            .select()
            .order("created_at", ascending: false)
            .execute()
            .value
        
        DispatchQueue.main.async {
            self.features = feature
        }
    }
    
    //MARK: -> TotalCalculate
   
    
}
