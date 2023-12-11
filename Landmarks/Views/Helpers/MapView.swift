//
//  MapView.swift
//  Landmarks
//
//  Created by Seif Abu El-Ela on 11/15/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium

    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }

    private var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }

    var body: some View {
        #if os(iOS)
        if #available(iOS 17.0, *) {
            Map(position: .constant(.region(region)))
        } else {
            Map(coordinateRegion: .constant(region))
        }
        #endif
        
        #if os(watchOS)
        if #available(watchOS 10.0, *) {
            Map(position: .constant(.region(region)))
        } else {
            Map(coordinateRegion: .constant(region))
        }
        #endif
        
        #if os(macOS)
        if #available(macOS 14.0, *) {
            Map(position: .constant(.region(region)))
        } else {
            Map(coordinateRegion: .constant(region))
        }
        #endif
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
