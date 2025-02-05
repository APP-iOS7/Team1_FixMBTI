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
                    }
                    .foregroundColor(.primary)

                    Spacer()
                    Toggle("", isOn: $isNotificationEnabled)
                        .labelsHidden()
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
