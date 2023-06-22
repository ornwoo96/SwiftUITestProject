//
//  SwiftUITestProjectApp.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/07.
//

import SwiftUI

@main
struct SwiftUITestProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            QRCodeScannerExampleView()
        }
    }
}
