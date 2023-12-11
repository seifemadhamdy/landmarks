//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Seif Abu El-Ela on 12/11/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
