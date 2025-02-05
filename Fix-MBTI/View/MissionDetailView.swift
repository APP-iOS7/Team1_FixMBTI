//
//  MissionDetailView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI
import SwiftData

struct MissionDetailView: View {
    var mission: Mission
    
    var body: some View {
        Text("미션뷰에서 미션 성공 후 후기작성(?) 페이지")
        Text(mission.title)
    }
}

//#Preview {
//    MissionDetailView(mission: Mission)
//}
