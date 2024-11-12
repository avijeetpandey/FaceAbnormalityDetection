//
//  IconButton.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

import SwiftUI

// MARK: IconButton
struct IconButton: View {
    let icon: Image
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                icon
                Text(label)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

