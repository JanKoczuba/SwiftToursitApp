//
//  LocationsViewModel.swift
//  TouristApp
//
//  Created by Jan Koczuba on 17/02/2025.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {

    //all loaded location
    @Published var locations: [Location]

    // current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }

    // current location on map
    @Published var mapPosition: MapCameraPosition = .region(MKCoordinateRegion())

    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapRegion(location: locations.first!)
    }

    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapPosition = .region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan
                )
            )

        }

    }
}
