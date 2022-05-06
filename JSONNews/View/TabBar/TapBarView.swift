//
//  TapBarView.swift
//  JSONNews
//
//  Created by Nazar Babyak on 03.05.2022.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width , height: CGFloat
    let systemIconName: String
    
    let tabNameSecond: String
    @Namespace var animation
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
            
            Text(tabNameSecond)
                .font(.system(size: 14, weight: .semibold, design: .monospaced))
            
        }
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .matchedGeometryEffect(id: "Current", in: animation)
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("BlueColor") : Color.secondary)
        .scaleEffect(
            withAnimation(.spring()){
                viewRouter.currentPage == assignedPage ? 1.0 : 0.8
            }
        )
    }
}
