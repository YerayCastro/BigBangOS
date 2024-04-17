//
//  ContentView.swift
//  BigBangOS
//
//  Created by Yery Castro on 9/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(BigBangVM.self) var vm
    
    @State var visbility: NavigationSplitViewVisibility = .all
    @State var seasonSelected: Int?
    @State var episodeSelected: BigBang?
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visbility) {
            List(selection: $seasonSelected) {
                ForEach(vm.logic.seasons, id: \.self) { season in
                    Image("season\(season)")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .tag(season)
                        .hoverEffect()
                }
            }
            .navigationTitle("Big Bang")
        } content: {
            if let seasonSelected {
                List(selection: $episodeSelected) {
                    ForEach(vm.logic.episodesBy(season: seasonSelected)) { episode in
                        VStack(alignment: .leading) {
                            Text(episode.name)
                                .font(.headline)
                            Text(episode.episodeInfo)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .tag(episode)
                        .hoverEffect()
                    }
                }
                .navigationTitle("Season \(seasonSelected)")
                .navigationBarTitleDisplayMode(.inline)
            }
        } detail: {
            if let episodeSelected {
                EpisodeDetail(episode: episodeSelected)
                    .padding()
            }
        }
        .navigationSplitViewStyle(.balanced)
        .onAppear {
            if seasonSelected == nil {
                seasonSelected = vm.logic.bigBang.first?.season
            }
            if episodeSelected == nil {
                episodeSelected = vm.logic.bigBang.first
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(BigBangVM.test)
}
