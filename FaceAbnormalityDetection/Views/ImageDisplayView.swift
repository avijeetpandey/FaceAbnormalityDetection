//
//  ImageDisplayView.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

import SwiftUI
import CoreData

// MARK: - ImageDisplayView
struct ImageDisplayView: View {
    @Environment(\.managedObjectContext) private var context
    
    // fetching the images from the core data store when the view is rendered
    @FetchRequest(
        entity: ImageEntity.entity(),
        sortDescriptors: []
    ) var images: FetchedResults<ImageEntity>

    var body: some View {
        ScrollView {
            ForEach(images) { imageEntity in
                if let imageData = imageEntity.imageData,
                   let uiImage = UIImage(data: imageData),
                   let status = imageEntity.status,
                   status == ImageStatus.processed.rawValue {
                    
                    VStack {
                        ZStack {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 300)

                            if let abnormalities = imageEntity.abnormalities {
                                FacialOverlayView(abnormalities: abnormalities)
                            }
                        }
                        .padding(.bottom)

                        Text("\(Constants.status) : \(imageEntity.status ?? "\(Constants.unknown)")")
                            .font(.headline)
                        
                        if let abnormalities = imageEntity.abnormalities {
                            Text("\(Constants.abnormalities): \(abnormalities)")
                                .font(.subheadline)
                                .padding(.top, 4)
                        }
                    }
                    .padding()
                }
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("\(Constants.results)")
    }
}


#Preview {
    ImageDisplayView()
}
