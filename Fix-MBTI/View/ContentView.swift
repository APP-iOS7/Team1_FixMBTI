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
    @State private var selectedTab = 0 

//    @Query private var items: [Item]

    var body: some View {
        TabView(selection: $selectedTab) {
            MissionView()
                .tabItem {
                    Image(selectedTab == 0 ? "HomeOn" : "HomeOff")
                }
                .tag(0)
                
            ListView()
                .tabItem {
                    Image(selectedTab == 1 ? "ListOn" : "ListOff")
                }
                .tag(1)
                
            SettingView()
                .tabItem {
                    Image(selectedTab == 2 ? "SettingOn" : "SettingOff")
                }
                .tag(2)
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Mission.self, inMemory: true)
}


// 대홍 git push test
