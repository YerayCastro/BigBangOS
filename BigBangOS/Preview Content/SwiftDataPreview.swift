//
//  SwiftDataPreview.swift
//  BigBangOS
//
//  Created by Yery Castro on 11/12/23.
//

import Foundation
import SwiftData

@MainActor
var testModelContainer: ModelContainer = {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: FavoriteData.self, configurations: config)
        
        let fav1 = FavoriteData(id: 2956)
        let fav2 = FavoriteData(id: 3049)
        let fav3 = FavoriteData(id: 1410334)
        
        container.mainContext.insert(fav1)
        container.mainContext.insert(fav2)
        container.mainContext.insert(fav3)
        return container
    } catch {
        fatalError("Error creando la base de datos para preview.")
    }
}()
