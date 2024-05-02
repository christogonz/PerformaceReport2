//
//  LoginCrudSupabaseApp.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-16.
//

import SwiftUI

@main
struct LoginCrudSupabaseApp: App {
    @StateObject var viewModel = ViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
