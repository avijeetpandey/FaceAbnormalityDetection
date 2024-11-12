//
//  ImageInfoModel.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//
import SwiftUI

// MARK: - ImageInfoModel
struct ImageInfoModel: Identifiable {
    let id = UUID() // unique indentifier for each image
    var image: UIImage
    var status: ImageStatus // to hold the current status of the image
    var abnormalities: String?
}

// MARK: - ImageStatus
enum ImageStatus: String {
    case processing
    case processed
    case invalid
}
