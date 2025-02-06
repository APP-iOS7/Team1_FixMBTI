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
        ScrollView {
            HStack {
                Image(systemName: post.imageName ?? "tray")
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
                    Text("\(post.timestamp)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                Spacer()
            }
            .padding(.vertical, 5)
        }
    }
}


#Preview {
    ListView()
}
