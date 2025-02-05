//
//  MBTISelectionView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI
import SwiftData

struct MBTISelectionView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    @State private var currentMBTI = ["E", "N", "T", "P"]
    @State private var targetMBTI = ["E", "N", "T", "P"]
    
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
                    .frame(width: 28, height: 30)
                
                MBTIPicker(selection: $targetMBTI, options: mbtiOptions)
                
                Button("완료") {
                    saveMBTI()
                    isFirstLaunch = false
                }
                .padding()
                .foregroundStyle(currentMBTI == targetMBTI ? .gray : .orange)
                .disabled(currentMBTI == targetMBTI)
                .opacity(currentMBTI == targetMBTI ? 0.5 : 1.0)
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
        
        let profile = MBTIProfile(currentMBTI: current, targetMBTI: target)
        
        let modelContext = try? ModelContainer(for: MBTIProfile.self).mainContext
        modelContext?.insert(profile)
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
                            .font(.system(size: 32))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(selection[index] == option ? .orange : .gray)
                        
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 60, height: 170)
                .clipped()
                
            }
        }
        .padding()
    }
}

#Preview {
    MBTISelectionView()
}
