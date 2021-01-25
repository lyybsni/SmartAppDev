//
//  What2EatApp.swift
//  What2Eat
//
//  Created by Richard Li on 25/1/2021.
//

import SwiftUI

@main
struct What2EatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
