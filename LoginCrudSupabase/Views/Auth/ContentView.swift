//
//  ContentView.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-16.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    
    var body: some View {
        if viewModel.isAuthenticated {
            GeometryReader { proxy in
                let topEdge = proxy.safeAreaInsets.top
                HomeView(viewModel: viewModel, topEdge: topEdge )
            }

        } else {
            AuthView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
