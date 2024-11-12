//
//  AbnormalitiesHelper.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

struct AbnormalitiesHelper {
    
    static let mockAbnormalities: [String] = ["Mouth Open",
                                       "Eyes Closed",
                                       "Nose Sore",
                                       "Mouth Sore",
                                       "Wrinkles",
                                       "Pigmentation",
                                       "Under Eye Bags",
                                       "Pores",
                                       "Eyes Open"]
    
    static var randomAbnormalities: String {
        return mockAbnormalities.randomElement() ?? ""
    }
}
