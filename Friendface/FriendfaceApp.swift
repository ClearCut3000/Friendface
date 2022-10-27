//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Николай Никитин on 27.10.2022.
//

import SwiftUI

@main
struct FriendfaceApp: App {
  @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
