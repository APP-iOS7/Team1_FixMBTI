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
    //    @Query private var missions: [Mission]
    @Query private var profiles: [MBTIProfile]
    @Query(sort: \ActiveMission.timestamp) private var activeMissions: [ActiveMission]
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activeMissions) { activeMission in
                    NavigationLink(destination: MissionDetailView(mission: Mission(title: activeMission.title,
                                                                                   detailText: activeMission.detailText,
                                                                                   category: activeMission.category))) {
                        HStack {
                            Text("\(activeMission.title), \(activeMission.category)체험")
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
                
                Button(action: sendTestNotification) {
                    Label("알림 테스트", systemImage: "bell.fill")
                }
            }
        }
    }
    
    private func addMission() {
        guard let profile = profiles.first else { return }
        
        let currentArray = Array(profile.currentMBTI)
        let targetArray = Array(profile.targetMBTI)
        var differentCategories: [String] = []
        
        for i in 0..<4 {
            if currentArray[i] != targetArray[i] {
                differentCategories.append(String(targetArray[i]))
            }
        }
        
        print("🎯 변화해야 할 카테고리들: \(differentCategories)")
        
        let availableMissions = missions.filter { mission in
            differentCategories.contains(mission.category)
        }
        
        if let randomMission = availableMissions.randomElement() {
            // 중복 체크
            if !activeMissions.contains(where: { $0.title == randomMission.title }) {
                let newActiveMission = ActiveMission(mission: randomMission)
                modelContext.insert(newActiveMission)
                print("📝 새 미션 추가됨: \(randomMission.title) (카테고리: \(randomMission.category))")
            }
        }
    }
    
    func deleteMission(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(activeMissions[index])
        }
    }
    
    // 테스트용 알림 즉시 보내기
    private func sendTestNotification() {
        let content = UNMutableNotificationContent()
        content.title = "테스트 알림"
        content.body = "이것은 즉시 발송된 테스트 알림입니다."
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // 5초 후 실행
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        print("📢 테스트 알림 예약 완료 (5초 후 도착)")
    }
    
}

#Preview {
    MissionView()
}

