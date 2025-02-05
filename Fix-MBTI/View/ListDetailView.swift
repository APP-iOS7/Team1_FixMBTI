//
//  ListDetailView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI
import SwiftData

struct ListDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
 
    var mission: Mission
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Image(mission.imageName ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text(mission.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("\(mission.timestamp)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                Text(mission.detailText)
                    .font(.body)
                    .padding(.horizontal)
                
                Spacer()
            }
            .padding(.vertical)
        }
        .navigationTitle("게시물 상세")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListDetailView(mission: Mission(title: "ㅇㅇㅇ", detailText: "ㅇㅇㅇ", imageName: "ListOn", category: "E")
    )
}
