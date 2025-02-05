//
//  ListDetailView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

//var title: String = ""          // 미션 제목
//var detailText: String = ""    // 미션 설명
//var timestamp: Date = Date()          // 미션 생성 날짜
//var randomTime: Date? = nil          // 랜덤 타임
//var imageName: String? = ""     // 이미지 추가
//var category: String = ""

import SwiftUI
import SwiftData

struct ListDetailView: View {
    
    let selectedMission: Mission
    
    var body: some View {
        Form {
            Section(header: Text("Selected Record")) {
                Image(systemName: selectedMission.imageName ?? "tray")
                    .resizable()
                    .clipShape(.rect(cornerRadius: 12))
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text(selectedMission.timestamp.description)
                Text("Target MBTI Element: \(selectedMission.category)")
                    .font(.headline)
                Text(selectedMission.title)
                    .font(.headline)
                Text(selectedMission.detailText)
            }
        }
    }
}

#Preview {
    ListDetailView(selectedMission: dummyPosts[2])
}
