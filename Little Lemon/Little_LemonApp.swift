//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Alexey Rasskazov on 05/10/2024.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            SplashView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
