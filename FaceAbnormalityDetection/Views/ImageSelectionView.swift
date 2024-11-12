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
    @State private var selectedSourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        NavigationView {
            VStack {
                
                // top button component
                buildImageSelectionView()
                
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
                handleImagePicker()
            }
        }
    }
    
    
    // MARK: - support view builders
    @ViewBuilder
    func handleImagePicker() -> some View {
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
    
    @ViewBuilder
    func buildImageSelectionView() -> some View {
        HStack(alignment: .center, spacing: 32) {
            IconButton(
                icon: Image(systemName: Constants.photo),
                label: Constants.selectImages,
                action: {
                    selectedSourceType = .photoLibrary
                    showImagePicker.toggle()
                }
            )
            
            IconButton(
                icon: Image(systemName: Constants.camera),
                label: Constants.captureImage,
                action: {
                    selectedSourceType = .camera
                    showImagePicker.toggle()
                }
            )
        }.padding()
    }
}


#Preview {
    ImageSelectionView()
}
