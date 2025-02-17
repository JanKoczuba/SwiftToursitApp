//
//  TouristAppApp.swift
//  TouristApp
//
//  Created by Jan Koczuba on 17/02/2025.
//

import SwiftUI

@main
struct TouristAppApp: App {

    @StateObject private var viewModel = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView().environmentObject(viewModel)
        }
    }
}
