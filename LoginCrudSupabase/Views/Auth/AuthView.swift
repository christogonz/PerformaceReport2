//
//  AuthView.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-16.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel: ViewModel

    // Esto es para cerrar la vista actual. como el Pop en flutter.
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color(.bgUI)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                
                HStack {
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Image(systemName: "storefront")
                        .font(.largeTitle)
                        .foregroundStyle(.accent)
                }
                .padding(.vertical)
                
                

                HStack {
                    Image(systemName: "at.circle")
                        .foregroundColor(.accent)
                        
                    TextField("Email", text: $viewModel.email)
                        .foregroundStyle(.gray)
                }.padding()
                    .background(Capsule().fill(Color.onBgUI))
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 10)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
                HStack {
                    Image(systemName: "key")
                        .foregroundColor(.accent)
                        
                    TextField("Password", text: $viewModel.password)
                        .foregroundStyle(.gray)
                }.padding()
                    .background(Capsule().fill(Color.onBgUI))
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 10)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                

//                TextField(text: $viewModel.email, label: {
//                    Text("Email")
//                })
//                .font(.title3)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(12)
//                .shadow(color: .black.opacity(0.88), radius: 60, x: 0.0, y: 16)
//                .autocorrectionDisabled()
//                .textInputAutocapitalization(.never)
//
//                TextField("Password", text: $viewModel.password)
//                    .font(.title3)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.gray.opacity(0.2))
//                    .cornerRadius(12)
//                    .shadow(color: .black.opacity(0.88), radius: 60, x: 0.0, y: 16)
//                    .autocorrectionDisabled()
//                    .textInputAutocapitalization(.never)

                Spacer()

                CustomButton(
                    title: "Sign in",
                    onPress: {
                        Task {
                            try await viewModel.signIn()
                            dismiss()
                        }
                    })

                Button(action: {
                }, label: {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                })
                .padding(.bottom, 35)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AuthView(viewModel: ViewModel())
}
