//
//  MissionView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI

struct MissionView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("dd")
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("홈")
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    MissionView()
}
