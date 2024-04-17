//
//  MainBigBang.swift
//  BigBangOS
//
//  Created by Yery Castro on 11/12/23.
//

import SwiftUI

struct MainBigBang: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem { Label("Episodes", systemImage: "tv") }
            
            FavEpisodesView()
                .tabItem { Label("Favorites", systemImage: "star") }
        }
        
    }
}

#Preview {
    MainBigBang()
        .environment(BigBangVM.test)
}
