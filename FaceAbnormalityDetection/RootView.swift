//
//  ContentView.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

import SwiftUI
import CoreData

struct RootView: View {    
    var body: some View {
        ImageSelectionView()
    }
}


#Preview {
    RootView().environment(\.managedObjectContext, CoreDataController.preview.container.viewContext)
}
