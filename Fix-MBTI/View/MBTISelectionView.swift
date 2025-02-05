//
//  MBTISelectionView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI
import SwiftData

struct MBTISelectionView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    @Query private var profiles: [MBTIProfile]
    @State private var currentMBTI = ["E", "N", "T", "P"]
    @State private var targetMBTI = ["I", "S", "F", "J"]
    
    
    let mbtiOptions = [
        ["E", "I"], // 외향형 vs 내향형
        ["N", "S"], // 직관형 vs 감각형
        ["T", "F"], // 사고형 vs 감정형
        ["P", "J"]  // 인식형 vs 판단형
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                MBTIPicker(selection: $currentMBTI, options: mbtiOptions)
                
                Image(systemName: "arrowshape.down.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                MBTIPicker(selection: $targetMBTI, options: mbtiOptions)
                
                Button("완료") {
                    saveMBTI()
                    isFirstLaunch = false
                    dismiss()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .disabled(currentMBTI == targetMBTI) // 현재, 목표 mbti같을때 완료버튼 비활성화
            }
            onAppear {
                if let savedProfile = profiles.first {
                    currentMBTI = Array(savedProfile.currentMBTI).map { String($0) }
                    targetMBTI = Array(savedProfile.targetMBTI).map { String($0) }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("MBTI 설정")
                        .font(.headline)
                }
            }
        }
    }
    
    private func saveMBTI() {
        let current = currentMBTI.joined() // "ENTP" 형식으로 변환
        let target = targetMBTI.joined()
        
        // 기존 데이터 삭제
        do {
            let existingProfiles = try modelContext.fetch(FetchDescriptor<MBTIProfile>())
            for profile in existingProfiles {
                modelContext.delete(profile)
            }
        } catch {
            print("❌ 기존 MBTI 데이터 삭제 실패: \(error)")
        }
        
        let profile = MBTIProfile(currentMBTI: current, targetMBTI: target)
        modelContext.insert(profile)
        print("🎯 MBTI 저장 완료: 현재 MBTI \(current), 목표 MBTI \(target)")
    }
    
    private func loadMBTI() {
        if let savedProfile = profiles.first {
            currentMBTI = Array(savedProfile.currentMBTI).map { String($0) }
            targetMBTI = Array(savedProfile.targetMBTI).map { String($0) }
        }
    }
    
}

struct MBTIPicker: View {
    @Binding var selection: [String]
    let options: [[String]]
    
    var body: some View {
        HStack {
            ForEach(0..<4, id: \.self) { index in
                Picker("", selection: $selection[index]) {
                    ForEach(options[index], id: \.self) { option in
                        Text(option)
                            .font(.title)
                            .frame(maxWidth: .infinity)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 60, height: 150)
                .clipped()
            }
        }
        .padding()
    }
}


#Preview {
    MBTISelectionView()
}
