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
            updateMapPosition(location: mapLocation)
        }
    }

    // current location on map
    @Published var mapPosition: MapCameraPosition = .region(
        MKCoordinateRegion())

    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    // Show list of location
    @Published var showLocationsList: Bool = false

    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapPosition(location: locations.first!)
    }

    private func updateMapPosition(location: Location) {
        withAnimation(.easeInOut) {
            mapPosition = .region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan
                )
            )

        }
    }

    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }

    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }

    func nextButtonPressed() {

        guard
            let currentIndex = locations.firstIndex(where: { $0 == mapLocation }
            )
        else {
            return
        }

        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }

        let nextLocation = locations[nextIndex]

        showNextLocation(location: nextLocation)

    }
}
