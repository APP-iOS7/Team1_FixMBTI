//
//  ContentView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        TabView {
            MissionView()
                .tabItem {
                    Image(systemName: "house")
                }
            ListView()
                .tabItem {
                    Image(systemName: "archivebox")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Mission.self, inMemory: true)
}
