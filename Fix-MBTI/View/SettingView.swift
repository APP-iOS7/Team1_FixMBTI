//
//  SettingView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI

struct SettingView: View {
    @State private var isShowingMBTISelection = false
    @State private var isNotificationEnabled = true
    
    @AppStorage("missionCount") private var missionCount: Int = 1 // 기본값 1개
    
    var body: some View {
        NavigationStack {
            List {
                Button("MBTI 변경") {
                    isShowingMBTISelection = true
                }
                .foregroundColor(.primary)
                
                Button("MBTI 검사하러 가기") {
                    openMBTITest()
                }
                .foregroundColor(.primary)

                
                HStack {
                    Button("알림 설정") {
                        isNotificationEnabled.toggle()
                        if isNotificationEnabled {
                            NotificationManager.instance.scheduleMissionNotification()
                        } else {
                            NotificationManager.instance.removeAllNotifications()
                        }
                    }
                    .foregroundColor(.primary)

                    Spacer()
                    Toggle("", isOn: $isNotificationEnabled)
                        .labelsHidden()
                }
                
                Section(header: Text("미션 개수 설정")) {
                    Picker("미션 개수", selection: $missionCount) {
                        ForEach(1...5, id: \.self) { count in
                            Text("\(count)개").tag(count)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: missionCount) { oldValue, newValue in
                        NotificationManager.instance.scheduleMissionNotification()
                        print("🔄 미션 개수 변경됨: \(oldValue) 에서 \(newValue)")
                        
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("환경설정")
                        .font(.headline)
                }
            }
            .sheet(isPresented: $isShowingMBTISelection) {
                MBTISelectionView()
            }
        }
    }
    
    private func openMBTITest() {
        if let url = URL(string: "https://www.16personalities.com/ko") {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingView()
}
