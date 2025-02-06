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
 
    @Binding var selectedPost: Mission?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Image(systemName: selectedPost?.imageName ?? "figure.run.treadmill.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text(selectedPost!.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("\(selectedPost!.timestamp)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                Text(selectedPost!.detailText)
                    .font(.body)
                    .padding(.horizontal)
                Spacer()
                HStack(alignment: .bottom) {
                    Spacer()
                    Button("Close") {
                        dismiss()
//                        ListView()
                    }
                    Spacer()
                    Button("Delete") {
                        deletePost()
                        dismiss()
                    }
                    Spacer()
                }
                .buttonStyle(.bordered)
            }
            .padding(.vertical)
        }
        .navigationTitle("게시물 상세")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func deletePost() {
        if let diary = selectedPost {
            if let index = dummyPosts.firstIndex(of: diary) {
                dummyPosts.remove(at: index)
            }
            selectedPost = nil
        }
    }
    
}

#Preview {
    @Previewable @State var previewPost: Mission? = dummyPosts[2]
    return ListDetailView(selectedPost: $previewPost)
}
