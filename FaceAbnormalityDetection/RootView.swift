//
//  ContentView.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

import SwiftUI
import CoreData

struct RootView: View {
    
    // clearning the previous data on app launch
    init() {
        CoreDataController.shared.clearAllData()
    }
    
    var body: some View {
        ImageSelectionView()
    }
}


#Preview {
    RootView().environment(\.managedObjectContext, CoreDataController.preview.container.viewContext)
}
