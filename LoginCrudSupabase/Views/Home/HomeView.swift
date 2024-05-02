//
//  HomeView.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-23.
//


import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State var offset: CGFloat = 0
    var topEdge: CGFloat
    
//    @Environment(\.dismiss) var dismiss
    
    func getTitleOpacity() -> CGFloat {
        let titleOffset = -getTitleOffset()
        let progress = titleOffset / 20
        let opacity = 1 - progress
        return opacity
    }

    func getTitleOffset() -> CGFloat {
        if offset < 0 {
            let progress = -offset / 120
            let newOffset = (progress <= 1.0 ? progress : 1) * 20
            return -newOffset
        }
        return 0
    }
    
    
    var body: some View {
        ZStack {
            BackgroundImage()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 8) {
                    
                    HeaderBalance(
                        totalTarget: viewModel.totalTargets,
                        totalSold: viewModel.totalSold,
                        totalLeft: viewModel.totalLeft,
                        totalLastWeek: viewModel.totalLastWeek,
                        totalPorcentage: viewModel.totalPercent,
                        topEdge: topEdge,
                        getTitleOpacity: {getTitleOpacity()})
                        .padding(.vertical, 5)
                        .offset(y: -offset)
                        .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                        .offset(y: getTitleOffset())
                    
                    
                    ForEach(viewModel.stores) {store in
                        let quarterPercentage = (Double(store.sell) / Double(store.target)) * 100
                        
                        CustomStackView {
                            Label {
                                Text(store.store)
                                    .foregroundStyle(.white)
                            } icon: {
                                Image(systemName: "storefront")
                            }
                        } contentView: {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 25) {
                                    StoreDataComponent(
                                        title: "Target",
                                        image: "flag.checkered.2.crossed",
                                        result: CGFloat(store.target)
                                    )
                                    StoreDataComponent(
                                        title: "Sold",
                                        image: "smartphone",
                                        result: CGFloat(store.sell)
                                    )
                                    StoreDataComponent(
                                        title: "Last Week",
                                        image: "calendar.badge.clock",
                                        result: CGFloat(store.lastWeek)
                                    )
                                    StoreDataComponent(
                                        title: "Left",
                                        image: "chart.line.uptrend.xyaxis",
                                        result: CGFloat((store.target) - (store.sell))
                                    )
                                    StoreDataComponent(
                                        title: "Quarter",
                                        image: "percent",
                                        result: CGFloat(quarterPercentage)
                                    )
                                }
                            }
                        }
                        
                    }
                }
                .task {
                    try? await viewModel.fetchStoreRequest()
                }
                .padding(.top, 70)
                .padding([.horizontal, .bottom])
                .overlay(
                    GeometryReader { proxy -> Color in
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        return Color.clear
                        
                    }
                )
            }
        }
    }
}

#Preview {
    ContentView()
}


