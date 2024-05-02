//
//  CustomButton.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-16.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var onPress: () -> Void
    
    var body: some View {
        Button(action: {
            onPress()
        }, label: {
            Text(title)
                .padding()
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .background(.accent)
                .cornerRadius(50)
        })
    }
}

#Preview {
    CustomButton(title: "Sign In", onPress: {})
}
