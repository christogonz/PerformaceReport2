//
//  StoreDataComponent.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-22.
//

import SwiftUI

struct StoreDataComponent: View {
    var title: String
    var image: String
    var result: CGFloat
    
    
    var body: some View {
        VStack(spacing: 15) {
            Text(title)
                .font(.callout.bold())
                .foregroundStyle(.gray)
            
            Image(systemName: image)
                .font(.title2)
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.gray, .white)
                .frame(height: 30)
            
            Text("\(Int(result))")
                .font(.callout.bold())
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    StoreDataComponent(title: "Target", image: "person", result: 50)
}
