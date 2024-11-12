//
//  ImageViewModel.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

import SwiftUI
import Vision
import CoreData

// MARK: - ViewModel 
class ViewModel: ObservableObject {
    @Published var images: [ImageInfoModel] = []
    @Published var navigateToAbnormalityDisplayPage = false
    private let context = CoreDataController.shared.container.viewContext
    
    func handleImageCapture(image: UIImage) {
        let imageInfoModel = ImageInfoModel(image: image,
                                            status: .processing,
                                            abnormalities: nil)
        images.append(imageInfoModel)
        
        detectFace(in: image) { [weak self] isFaceDetected in
            guard let self = self else { return }
            
            if isFaceDetected {
                assignMockAbnormalities(to: imageInfoModel)
            } else {
                updateImageStatus(imageInfoModel, status: .invalid)
            }
        }
        
        handleRedirectionForImageCount()
    }
    
    func handleImageSelection(image: UIImage) {
        let selectedImageInfoModel = ImageInfoModel(image: image,
                                                    status: .processing,
                                                    abnormalities: nil)
        
        images.append(selectedImageInfoModel)
        assignMockAbnormalities(to: selectedImageInfoModel)
    }
    
    private func detectFace(in image: UIImage, completion: @escaping (Bool) -> Void) {
        let faceDetectionRequest = VNDetectFaceRectanglesRequest { request, error in
            guard error == nil else {
                completion(false)
                return
            }
            
            guard let results = request.results as? [VNFaceObservation] else {
                completion(false)
                return
            }
            
            completion(results.count > 0)
        }
        
        let handler = VNImageRequestHandler(cgImage: image.cgImage!)
        
        DispatchQueue.global(qos: .userInitiated).async {
            try? handler.perform([faceDetectionRequest])
        }
        
        handleRedirectionForImageCount()
    }
    
    private func assignMockAbnormalities(to imageModel: ImageInfoModel) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2.0) { [weak self] in
            DispatchQueue.main.async {
                self?.updateImageStatus(imageModel,
                                        status: .processed,
                                        abnormalities: AbnormalitiesHelper.randomAbnormalities)
            }
        }
    }
    
    // updates the image status
    private func updateImageStatus(_ image: ImageInfoModel, status: ImageStatus, abnormalities: String? = nil) {
        if let index = images.firstIndex(where: { $0.id == image.id }) {
            images[index].status = status
            images[index].abnormalities = abnormalities
            saveToCoreData(images[index])
        }
    }
    
    // save the captured/picked image to the coredata
    private func saveToCoreData(_ image: ImageInfoModel) {
        let newImageEntity = ImageEntity(context: context)
        newImageEntity.imageData = image.image.jpegData(compressionQuality: 1.0)
        newImageEntity.status = image.status.rawValue
        newImageEntity.abnormalities = image.abnormalities
        
        do {
            try context.save()
        } catch {
            print("Failed to save image:", error)
        }
    }
    
    private func handleRedirectionForImageCount() {
        if images.count >= 10 {
            navigateToAbnormalityDisplayPage = true
        }
    }
}
