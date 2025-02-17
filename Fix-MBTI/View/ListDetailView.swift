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
    
    let post: PostMission
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                // 이미지 로드 로직 추가
                HStack {
                    Spacer()
                    if let imageName = post.imageName,
                       let uiImage = loadImage(fileName: imageName) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 335)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 335, height: 335)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Spacer()
                }
                HStack(alignment: .bottom) {
                    Text(post.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    Spacer()
                    Text(post.category)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(hex: "FA812F"))
                        .padding(.trailing)                }
                
                HStack(alignment: .bottom) {
                    Text(post.detailText)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .padding(.horizontal)
                    Spacer()
                    Text(post.timestamp.formatted(date: .numeric, time: .omitted))
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                Divider()
                    .padding(.horizontal)
                
                
                
                Text(post.content)
                    .font(.body)
                    .padding(.horizontal)
                
                
            }
            .padding(.vertical)
        }
        .navigationTitle("게시물 상세")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func deletePost() {
        // 게시물 삭제 로직 추가
        modelContext.delete(post)
    }
    
    // 이미지 로드 함수
    private func loadImage(fileName: String) -> UIImage? {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        if let imagePath = documentsDirectory?.appendingPathComponent(fileName) {
            return UIImage(contentsOfFile: imagePath.path)
        }
        return nil
    }
}

#Preview {
    ListDetailView(post: PostMission(mission: Mission(title: "sfldjfksdfjsdfsdf", detailText: "sfdsdfsdfsdfsdf", timestamp: Date(), imageName: "", category: "E"), content: "sdfsfsdfsdfs"))
}
