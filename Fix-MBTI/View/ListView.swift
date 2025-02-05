//
//  ListView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI
import SwiftData

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let thumbnail: String
    let description: String
}

struct ListView: View {
    @Environment(\.modelContext) private var modelContext
       @Query private var missions: [Mission]
    
    let posts: [Post] = [
        Post(title: "감동적인 영화 한편 보는거 어때", thumbnail: "sample1", description: ""),
        Post(title: "오늘은 친구 없이 혼자 놀아봐", thumbnail: "sample2", description: ""),
        Post(title: "계획없이 여행을 떠나보자", thumbnail: "sample3", description: "")
    ]
    
    var body: some View {
        NavigationStack {
            List(posts) { post in
                HStack {
                    Image(post.thumbnail)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 85, height: 85)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Spacer()
                    VStack(alignment: .leading, spacing: 5) {
                        Spacer()

                        Text(post.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        Text("게시 날짜: 2024-02-05")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()

                    }
                    
                    Spacer()
                }
                .padding(.vertical, 5)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("게시물")
                        .font(.headline)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
