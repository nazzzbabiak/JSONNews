//
//  ContentView.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var viewRouter = ViewRouter()

    var body: some View {
        TapBar(viewRouter: ViewRouter())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
