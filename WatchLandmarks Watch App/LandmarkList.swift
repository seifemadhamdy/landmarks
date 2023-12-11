//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by Seif Abu El-Ela on 12/11/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject() var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        }
    }
}

#Preview {
    LandmarkList()
        .environmentObject(ModelData())
}
