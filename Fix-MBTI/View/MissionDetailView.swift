//
//  MissionDetailView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import Foundation
import SwiftUI
import SwiftData

struct MissionDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    @State private var inputText: String = ""
    
    private let mission: Mission  // let으로 변경
    
    init(mission: Mission) {  // 명시적 생성자 추가
        self.mission = mission
    }
    
    var body: some View {
        VStack {
            Button(action: { isImagePickerPresented.toggle() }) {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 50))
                            .foregroundColor(Color("FA812F"))
                    }
                    .frame(width: 350, height: 350)
                    .background(Color("F8F8F8"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
            .sheet(isPresented: $isImagePickerPresented) {
                //                ImagePicker(image: $selectedImage)
            }
            HStack {
                Text(mission.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .padding(.leading)
                
                Spacer()
                
                Text(mission.category)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("FA812F"))
                    .padding(.trailing)
                
            }
            
            HStack {
                Text(mission.detailText)
                    .font(.caption)
                    .lineLimit(1)
                    .padding(.leading)
                Spacer()
            }
            
            TextEditor(text: $inputText)
                .font(.system(size: 18))
                .overlay(alignment: .topLeading) {
                    Text("문구 입력..")
                        .font(.system(size: 18))
                        .foregroundStyle(inputText.isEmpty ? .gray : .clear)
                        .padding(.top, 8)
                        .padding(.horizontal, 5)
                }
                .frame(height: 200)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
            
            
            Spacer()
            
            Text("완료")
                .padding()
                .frame(maxWidth: .infinity)
                .background(inputText.isEmpty || selectedImage == nil ? Color.gray : Color("FA812F"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
                .offset(y: -20)
                .disabled(inputText.isEmpty)
                .onTapGesture {
                    savePost()
                }
        }
        .padding()
        .navigationTitle("게시물 작성")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func savePost() {
        let postMission = PostMission(mission: mission, content: inputText)
        modelContext.insert(postMission)
        modelContext.delete(mission)
        
        do {
            print("게시물 저장: \(inputText)")
            try modelContext.save()
            dismiss()
        } catch {
            print("저장 중 오류 발생: \(error)")
        }
    }
}

#Preview {
    MissionDetailView(mission: Mission(title: "오늘하루 계획 짜봐", detailText: "sdsdsdsdsdsd", category: "E"))
}
