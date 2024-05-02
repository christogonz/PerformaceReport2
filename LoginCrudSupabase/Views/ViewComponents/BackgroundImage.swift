//
//  BackgroundImage.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-22.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        GeometryReader { proxy in
                
            Image("BackgroundImg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .brightness(-0.2)
        }
        .ignoresSafeArea()
        .overlay(.ultraThinMaterial)
    }
}

#Preview {
    BackgroundImage()
}
