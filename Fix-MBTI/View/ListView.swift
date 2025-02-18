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
    @Query private var posts: [PostMission]
    @State var stackPath = NavigationPath()
    @State var categories = ["전체보기", "E", "I", "N", "S", "T", "F", "P", "J"]
    @State var category = "전체보기"
    
    private var filteredPosts: [PostMission] {
        category == "전체보기" ? posts : posts.filter { $0.category == category }
    }
    
    private var categoryPicker: some View {
        HStack {
            Spacer()
            Picker("Category", selection: $category) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            .frame(width: 160, height: 30, alignment: .trailing)
            .cornerRadius(10)
        }
    }
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            
            
            VStack {
                categoryPicker
                    .offset(y: 4)

                if filteredPosts.isEmpty {
                    ContentUnavailableView("게시물 없음", systemImage: "doc.text")
                } else {
                    List {
                        ForEach(filteredPosts) { post in
                            NavigationLink(destination: ListDetailView(post: post)) {
                                ListCellView(post: post)
                                    .padding(.init(top: 0, leading: -5.5, bottom: -11, trailing: 0))
                            }
                        }
                        .onDelete { index in
                            deletePost(at: index)
                        }
                    }
                    .listRowSpacing(10)
                    
                    }
                }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("게시물")
                        .font(.headline)
                }
                    
            }
            
        }
        .accentColor(Color("ThemeColor"))
    }
    
    // 게시물 삭제 함수
    private func deletePost(at indexSet: IndexSet) {
        for index in indexSet {
            let postToDelete = posts[index]
            
            // 이미지 삭제
            if let imageName = postToDelete.imageName {
                deleteImage(named: imageName)
            }
            
            modelContext.delete(postToDelete)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("게시물 삭제 실패: \(error)")
        }
    }
    
    // 이미지 파일 삭제 함수
    private func deleteImage(named: String) {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent(named)
            try? FileManager.default.removeItem(at: fileURL)
        }
    }
}



#Preview {
    ListView()
}
