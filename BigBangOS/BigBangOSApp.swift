//
//  BigBangOSApp.swift
//  BigBangOS
//
//  Created by Yery Castro on 9/12/23.
//

import SwiftUI

@main
struct BigBangOSApp: App {
    @State var vm = BigBangVM()
    
    var body: some Scene {
        WindowGroup {
            MainBigBang()
                .environment(vm)
        }
        .modelContainer(for: FavoriteData.self)
    }
}
