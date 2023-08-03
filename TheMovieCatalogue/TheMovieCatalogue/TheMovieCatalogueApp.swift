//
//  TheMovieCatalogueApp.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 15/06/23.
//

import SwiftUI

@main
struct TheMovieCatalogueApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            TabViewNavigation()
                .environmentObject(networkMonitor)
        }
    }
}
