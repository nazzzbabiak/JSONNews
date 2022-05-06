//
//  JSONNewsApp.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import SwiftUI
import CoreData

@main
struct JSONNewsApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
