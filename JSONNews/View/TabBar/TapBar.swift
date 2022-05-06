//
//  TapBar.swift
//  JSONNews
//
//  Created by Nazar Babyak on 03.05.2022.
//

import SwiftUI


struct TapBar: View {
    
    @StateObject var viewRouter: ViewRouter
    @Namespace var animation
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Spacer()
            GeometryReader { index in
                ZStack(alignment: .bottom) {
                    switch viewRouter.currentPage {
                    case .viewed:
                        HomeMostViewed()
                            .ignoresSafeArea()
                    case .emailed:
                        HomeMostPopular()
                            .ignoresSafeArea()
                    case .shared:
                        HomeMostShared()
                            .ignoresSafeArea()
                    case .saved:
                        SavedPage()
                    }
                    
                    Spacer()
                    
                    HStack {
                        TabBarView(viewRouter: viewRouter,
                                   assignedPage: .viewed,
                                   width: index.size.width / 5,
                                   height: index.size.height / 28,
                                   systemIconName: "square.stack.3d.down.right",
                                   tabNameSecond: "Viewed")
                        Spacer()
                        TabBarView(viewRouter: viewRouter,
                                   assignedPage: .emailed,
                                   width: index.size.width / 5,
                                   height: index.size.height / 28,
                                   systemIconName: "square.stack.3d.down.right",
                                   tabNameSecond: "Emailed")
                        Spacer()
                        TabBarView(
                            viewRouter: viewRouter,
                            assignedPage: .shared,
                            width: index.size.width / 5,
                            height: index.size.height / 28,
                            systemIconName: "square.stack.3d.down.right",
                            tabNameSecond: "Shared")
                        Spacer()
                        TabBarView(viewRouter: viewRouter,
                                   assignedPage: .saved,
                                   width: index.size.width / 5,
                                   height: index.size.height / 28,
                                   systemIconName: "square.stack.3d.down.right",
                                   tabNameSecond: "Saved")
                    }
                    .frame(width: index.size.width / 1.05, height: index.size.height / 12)
                    .matchedGeometryEffect(id: "Current", in: animation)
                    .background(.ultraThinMaterial)
                    .cornerRadius(22)
                    .padding(.bottom, 20)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}


struct TapBar_Previews: PreviewProvider {
    static var previews: some View {
        TapBar(viewRouter: ViewRouter())
    }
}


