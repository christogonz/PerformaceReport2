//
//  HeaderBalance.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-22.
//

import SwiftUI

struct HeaderBalance: View {
    @ObservedObject var viewModel = ViewModel()

    var totalTarget: Int
    var totalSold: Int
    var totalLeft: Int
    var totalLastWeek: Int
    var totalPorcentage: Int

    @State var offset: CGFloat = 0
    var topEdge: CGFloat
    var getTitleOpacity: () -> CGFloat

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("B A L A N C E")
                .fontWeight(.thin)
                .font(.system(size: 35))
                .foregroundStyle(.white)
                .shadow(radius: 5)

            Text("\(totalPorcentage)%")
                .font(.system(size: 30))
                .foregroundStyle(totalPorcentage >= 90 ? .blue : .red)
                .shadow(radius: 5)
                .opacity(getTitleOpacity())

            Text("Totals")
                .foregroundStyle(.secondary)
                .foregroundStyle(.white)
                .shadow(radius: 5)
                .opacity(getTitleOpacity())
                
            HStack (spacing: 5) {
                VStack (spacing: 5) {
                        CustomStackView {
                            Label {
                                HStack {
                                    Text("Sold")
                                        .foregroundStyle(.secondary)
                                    Spacer()
                                    Text("\(totalSold)")
                                        .padding(.trailing,10)
                                        
                                }
                            } icon: {
                                Image(systemName: "smartphone")
                            }
                        } contentView: {}
                        
                        CustomStackView {
                            Label {
                                HStack {
                                    Text("Last Week")
                                        .foregroundStyle(.secondary)
                                    Spacer()
                                    Text("\(totalLastWeek)")
                                        .padding(.trailing,10)
                                }
                            } icon: {
                                Image(systemName: "calendar.badge.clock")
                            }
                        } contentView: {}
                    }
                    
                    VStack (spacing: 5){
                        CustomStackView {
                            Label {
                                HStack {
                                    Text("Left")
                                        .foregroundStyle(.secondary)
                                    Spacer()
                                    Text("\(totalLeft)")
                                        .padding(.trailing,10)
                                }
                            } icon: {
                                Image(systemName: "chart.line.uptrend.xyaxis")
                            }
                        } contentView: {}
                        
                        CustomStackView {
                            Label {
                                HStack {
                                    Text("Target")
                                        .foregroundStyle(.secondary)
                                    Spacer()
                                    Text("\(totalTarget)")
                                        .padding(.trailing,10)
                                }
                            } icon: {
                                Image(systemName: "flag.checkered.2.crossed")
                            }
                        } contentView: {}
                    }
                }
                .opacity(getTitleOpacity())
        }
    }
}

#Preview {
    ContentView()
}
