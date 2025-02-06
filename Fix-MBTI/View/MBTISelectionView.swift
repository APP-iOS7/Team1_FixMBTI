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
    
    // 전체 MBTI 타입 배열
    let mbtiTypes = [
        "ISTJ", "ISFJ", "INFJ", "INTJ",
        "ISTP", "ISFP", "INFP", "INTP",
        "ESTP", "ESFP", "ENFP", "ENTP",
        "ESTJ", "ESFJ", "ENFJ", "ENTJ"
    ]
    
    @State private var selectedCurrentMBTI: String = ""
    @State private var selectedTargetMBTI: String = ""
    
    // 완료 버튼 활성화 조건을 계산하는 프로퍼티
    private var isCompleteButtonDisabled: Bool {
        selectedCurrentMBTI.isEmpty ||
        selectedTargetMBTI.isEmpty ||
        selectedCurrentMBTI == selectedTargetMBTI
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("현재 MBTI 선택")
                    .font(.headline)
                
                Picker("현재 MBTI", selection: $selectedCurrentMBTI) {
                    ForEach(mbtiTypes, id: \.self) { mbti in
                        Text(mbti).tag(mbti)
                    }
                }
                .pickerStyle(.wheel)
                
                Image(systemName: "arrowshape.down.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("목표 MBTI 선택")
                    .font(.headline)
                
                Picker("목표 MBTI", selection: $selectedTargetMBTI) {
                    ForEach(mbtiTypes, id: \.self) { mbti in
                        Text(mbti).tag(mbti)
                    }
                }
                .pickerStyle(.wheel)
                
                Button("완료") {
                    saveMBTI()
                    isFirstLaunch = false
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .disabled(isCompleteButtonDisabled)
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("MBTI 설정")
                        .font(.headline)
                }
            }
            .onAppear {
                loadMBTI()
            }
        }
    }
    
    private func saveMBTI() {
        // 기존 데이터 삭제
        do {
            let existingProfiles = try modelContext.fetch(FetchDescriptor<MBTIProfile>())
            for profile in existingProfiles {
                modelContext.delete(profile)
            }
        } catch {
            print("❌ 기존 MBTI 데이터 삭제 실패: \(error)")
        }
        
        // 새 프로필 저장
        let profile = MBTIProfile(currentMBTI: selectedCurrentMBTI,
                                  targetMBTI: selectedTargetMBTI)
        modelContext.insert(profile)
        
        print("✅ MBTI 저장 완료: 현재 MBTI \(selectedCurrentMBTI), 목표 MBTI \(selectedTargetMBTI)")
    }
    
    private func loadMBTI() {
        if let savedProfile = profiles.first {
            selectedCurrentMBTI = savedProfile.currentMBTI
            selectedTargetMBTI = savedProfile.targetMBTI
        }
    }
}


#Preview {
    MBTISelectionView()
}
