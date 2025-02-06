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
                                .font(.headline)
                                .foregroundStyle(Color(hex: "222222"))
                        }
                        .padding(.bottom)
                        .padding(.top)
                        .cornerRadius(15)
                        
                    }
                    

                }
                .onDelete(perform: deleteMission)
             //   .listRowBackground(Color(hex: "FAB12F"))

            }
            .listRowSpacing(20)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("미션")
                        .font(.headline)
                }
            }
            .toolbar {
                Button(action: addMission) {
                    Label("미션 추가", systemImage: "plus")
                }

                Button(action: sendTestNotification) {
                    Label("알림 테스트", systemImage: "bell.fill")
                }
            }
        }
        .accentColor(Color(hex: "FA812F"))
    }
    
    // ✅ 테스트용 알림 즉시 보내기
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
