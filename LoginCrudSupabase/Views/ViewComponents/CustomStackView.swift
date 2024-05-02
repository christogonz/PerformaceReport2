//
//  CustomStackView.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-22.
//

import SwiftUI

struct CustomStackView<Title: View, Content: View>: View {
    var titleView: Title
    var contentView: Content
    
    @State var topOffset: CGFloat = 0
    @State var bottomOffset: CGFloat = 0
    
    init(@ViewBuilder titleView: @escaping () -> Title, @ViewBuilder
        contentView: @escaping () -> Content) {
        self.contentView = contentView()
        self.titleView = titleView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            titleView
                .font(.callout)
                .lineLimit(1)
            // Mac height...
                .frame(height: 38)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(.ultraThinMaterial, in: CustomCorner(corners: bottomOffset < 38 ? .allCorners : [.topLeft, .topRight], radius: 12))
                .zIndex(1)
            
            VStack {
                
//                Divider()
                
                contentView
                    .padding()
            }
            .background(.ultraThinMaterial, in: CustomCorner(corners: [.bottomLeft, .bottomRight], radius: 12))
            // Moving content Upward
            .offset(y: topOffset >= 120 ? 0 : -(-topOffset + 120))
            .zIndex(0)
            .clipped()
            .opacity(getOpacity())
        }
        .colorScheme(.dark)
//        .brightness(-0.1)
        .cornerRadius(12)
        .opacity(getOpacity())
        // Stopping View @120...
        .offset(y: topOffset >= 120 ? 0 : -topOffset + 120)
        .background(
            
            GeometryReader { proxy -> Color in
                let minY = proxy.frame(in: .global).minY
                let maxY = proxy.frame(in: .global).maxY
                
                DispatchQueue.main.async {
                    self.topOffset = minY
                    // reducing 120...
                    self.bottomOffset = maxY - 120
                }
                return Color.clear
            }
        )
    }
    
    
    
    // Opacity...
    func getOpacity() -> CGFloat {
        
        if bottomOffset < 28 {
            let progress = bottomOffset / 28
            return progress
        }
        return 1
    }
}

#Preview {
    ContentView()
}
