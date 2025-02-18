//
//  LocationsView.swift
//  TouristApp
//
//  Created by Jan Koczuba on 17/02/2025.
//

import MapKit
import SwiftUI

struct LocationsView: View {

    @EnvironmentObject private var viewModel: LocationsViewModel
    

    var body: some View {
        ZStack {
            Map(position:  $viewModel.mapPosition)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
