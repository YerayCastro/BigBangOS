//
//  FavoriteData.swift
//  BigBangOS
//
//  Created by Yery Castro on 11/12/23.
//

import SwiftUI
import SwiftData

@Model
final class FavoriteData {
    @Attribute(.unique) let id: Int
    
    init(id: Int) {
        self.id = id
    }
}
