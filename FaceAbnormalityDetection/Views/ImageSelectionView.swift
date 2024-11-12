//
//  ImageSelectionView.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

import SwiftUI
import CoreData

struct ImageSelectionView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var showImagePicker = false
    @State private var selectedSourceType: UIImagePickerController.SourceType = .photoLibrary

    var body: some View {
        NavigationView {
            VStack {
                Button("Select Images") {
                    selectedSourceType = .photoLibrary
                    showImagePicker.toggle()
                }
                Button("Capture Image") {
                    selectedSourceType = .camera
                    showImagePicker.toggle()
                }
                NavigationLink(destination: ImageDisplayView(),
                               isActive: $viewModel.navigateToAbnormalityDisplayPage) {
                    EmptyView()
                }
                
                List(viewModel.images) { image in
                    HStack {
                        Image(uiImage: image.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text(image.status.rawValue)
                    }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: selectedSourceType) { image in
                    switch selectedSourceType {
                    case .photoLibrary:
                        viewModel.handleImageSelection(image: image)
                    case .camera:
                        viewModel.handleImageCapture(image: image)
                    case .savedPhotosAlbum:
                        break
                    @unknown default:
                        break
                    }
                }
            }
        }
    }
}


#Preview {
    ImageSelectionView()
}
