//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Seif Abu El-Ela on 12/10/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
