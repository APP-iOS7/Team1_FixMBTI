//
//  ListView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var stackPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach(dummyPosts) { posts in
                    NavigationLink(value: posts) {
                        ListCellView(post: posts)
                    }
                }
            }
            .navigationTitle("MBTI Diary Post")
            .toolbar { EditButton() }
        }
    }
}

struct ListCellView: View {
    var post: Mission
    
    var body: some View {
        NavigationStack {
            HStack {
                Image(systemName: post.imageName ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 85, height: 85)
                    .background(Color(hex: "FAB12F"))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(.top)
                
                    Text(post.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.leading)
                        .offset(x: -8, y: -10)
                
                  
            }
            
            .padding(.vertical, 5)
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


#Preview {
    ListView()
}
