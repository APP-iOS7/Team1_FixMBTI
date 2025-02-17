//
//  MissionCellView.swift
//  Fix-MBTI
//
//  Created by 이수겸 on 2/18/25.
//

import SwiftUI
import SwiftData

struct MissionCellView: View {
    var mission: ActiveMission
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(mission.title)")
                    .font(.headline)
                //  .foregroundStyle(Color(hex: "222222"))
                
                Spacer()
                HStack(alignment: .bottom) {
                    HStack {
                        Text(mission.category)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hex: "FA812F"))  // category만 오렌지색으로
                        Text("미션")
                            .font(.footnote)
                            .fontWeight(.bold)
                        //    .foregroundStyle(Color(hex: "222222"))  // "체험"은 기존 색상 유지
                    }
                    Spacer()
                    Text("\(mission.timestamp.formatted(date: .numeric, time: .omitted))")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    //  .foregroundStyle(Color(hex: "222222"))
                    
                }
            }
            Spacer()
        }
    }
}
