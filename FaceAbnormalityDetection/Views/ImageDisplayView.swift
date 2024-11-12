//
//  ImageDisplayView.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

import SwiftUI
import CoreData

struct ImageDisplayView: View {
    @Environment(\.managedObjectContext) private var context
    
    // fetching the images from the core data store when the view is rendered
    @FetchRequest(
        entity: ImageEntity.entity(),
        sortDescriptors: []
    ) var images: FetchedResults<ImageEntity>

    var body: some View {
        List(images) { imageEntity in
            if let imageData = imageEntity.imageData,
               let uiImage = UIImage(data: imageData) {
                VStack {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)

                    Text("\(Constants.status) : \(imageEntity.status ?? "\(Constants.unknown)")")
                        .font(.headline)

                    if let abnormalities = imageEntity.abnormalities {
                        Text("\(Constants.abnormalities): \(abnormalities)")
                            .font(.subheadline)
                    }
                }
            }
        }
        .navigationTitle("\(Constants.results)")
    }
}

#Preview {
    ImageDisplayView()
}
