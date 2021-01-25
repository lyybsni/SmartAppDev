//
//  What2EatApp.swift
//  What2Eat
//
//  Created by Richard Li on 25/1/2021.
//

import SwiftUI

@main
struct What2EatApp: App {
    // let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            TabView {
                BodyWeightMonitorView()
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("Weight")
                    }
                Text("Select a Restaurant")
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("Restaurant")
                    }
                Text("Record the Storage")
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Food")
                    }
                Text("Consume Report")
                    .tabItem {
                        Image(systemName: "4.square.fill")
                        Text("Energy")
                    }
            }
            .font(.headline)
        }
    }
}
