//
//  MissionView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI
import SwiftData

struct MissionView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var missions: [Mission]
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(missions) { mission in
                    NavigationLink(destination: MissionDetailView(mission: mission)) {
                        HStack {
                            Text(mission.title)
                        }
                    }
                }
                .onDelete(perform: deleteMission)
            }
            .navigationTitle("나의 미션")
            .toolbar {
                Button(action: addMission) {
                    Label("미션 추가", systemImage: "plus")
                }
            }
        }
    }
    
    func addMission() {
        let newMission = Mission(title: "즉흥적인 약속 잡기", detailText: "계획 없이 친구에게 연락해서 만나기", category: "P")
        modelContext.insert(newMission)
    }
    
    func deleteMission(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(missions[index])
        }
    }
    
}

#Preview {
    MissionView()
}
