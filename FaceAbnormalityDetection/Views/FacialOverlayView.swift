//
//  FacialOverlayView.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

import SwiftUI

struct FacialOverlayView: View {
    var abnormalities: String

    var body: some View {
        ZStack {
            // Wrinkles label
            if abnormalities.contains("Wrinkles") {
                Text("Wrinkles")
                    .font(.caption)
                    .padding(4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .offset(x: -50, y: -100) // Adjust to desired position
            }
            
            // Under Eye Bags label
            if abnormalities.contains("Under Eye Bags") {
                Text("Under Eye Bags")
                    .font(.caption)
                    .padding(4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .offset(x: 30, y: -20) // Adjust to desired position
            }
            
            // Pigmentation label
            if abnormalities.contains("Pigmentation") {
                Text("Pigmentation")
                    .font(.caption)
                    .padding(4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .offset(x: -30, y: 10) // Adjust to desired position
            }
            
            // Pores label
            if abnormalities.contains("Pores") {
                Text("Pores")
                    .font(.caption)
                    .padding(4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .offset(x: -50, y: 40) // Adjust to desired position
            }
            
            // Firmness label
            if abnormalities.contains("Firmness") {
                Text("Firmness")
                    .font(.caption)
                    .padding(4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .offset(x: 50, y: 80) // Adjust to desired position
            }
        }
    }
}

#Preview {
    FacialOverlayView(abnormalities: "Pigmentation")
}
