//
//  ListView.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("dd")
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("게시물")
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    ListView()
}
