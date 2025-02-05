//
//  ListView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

/*
 var id: UUID =
 var imageData: Data? 필요하지 않나?
 */

//var title: String = ""          // 미션 제목
//var detailText: String = ""    // 미션 설명
//var timestamp: Date = Date()          // 미션 생성 날짜
//var randomTime: Date? = nil          // 랜덤 타임
//var imageName: String? = ""     // 이미지 추가
//var category: String = ""

import SwiftUI
import SwiftData

struct ListView: View {
//    @Environment(\.modelContext) private var modelContext
//    @State private var missions: [Mission]
    
    var body: some View {
        Text("ListView")
//        NavigationStack {
//            List {
//                ForEach(missions) { mission in
//                    NavigationLink(value: mission) {
//                        ListDetailView(mission: mission)
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    ListView(/*for: Mission.self, inMemory: true*/)
}
