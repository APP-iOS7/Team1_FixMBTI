//
//  ListCellView.swift
//  Fix-MBTI
//
//  Created by 이수겸 on 2/14/25.
//


import SwiftUI
import SwiftData

struct ListCellView: View {
    var post: PostMission
    
    // 이미지 로드 함수 추가
    private func loadImage(fileName: String) -> UIImage? {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        if let imagePath = documentsDirectory?.appendingPathComponent(fileName) {
            return UIImage(contentsOfFile: imagePath.path)
        }
        return nil
    }
    
    var body: some View {
        ScrollView {
            HStack(spacing: 10) {
                // 이미지 표시 로직 변경
                if let imageName = post.imageName,
                   let uiImage = loadImage(fileName: imageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                
                VStack(alignment: .leading) {
                    
                    
                    Text(post.title)
                        .font(.headline)
                        .foregroundColor(.primary)
//                    Text(post.detailText)
//                        .font(.caption2)
//                        .foregroundStyle(.gray)
                    Spacer()
                    HStack(alignment: .bottom) {
                        Text("\(post.category)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hex: "FA812F"))
                        Spacer()
//                        Text("\(post.timestamp.formatted(date: .numeric, time: .omitted))")
//                            .font(.caption2)
//                            .foregroundColor(.gray)
                    }
                }
                Spacer()
            }
            .frame(height: 90)
            .padding(.vertical, 5)
        }
    }
}

#Preview {
    ListCellView(post: PostMission(mission: Mission(title: "하루 동안 긍정적인 말 3번 이상 하기", detailText: "하루동안 어머고 어어얼니런하세요 ㅇ그리고 아아아", category: "E"), content: "dddddddddd"))
}
