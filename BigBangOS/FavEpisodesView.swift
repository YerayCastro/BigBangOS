//
//  FavEpisodesView.swift
//  BigBangOS
//
//  Created by Yery Castro on 11/12/23.
//

import SwiftUI
import SwiftData

struct FavEpisodesView: View {
    @Environment(BigBangVM.self) var vm
    @Query(sort: \FavoriteData.id) var favs: [FavoriteData]
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 225))]
    
    @State var selected: BigBang?
    
    var body: some View {
        NavigationStack {
            if favs.count > 0 {
                HStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 40) {
                            ForEach(favs) { fav in
                                if let episode = vm.logic.getEpisodeBy(id: fav.id) {
                                    VStack {
                                        Image(episode.image)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .padding(3)
                                        VStack(alignment: .leading){
                                            Text(episode.name)
                                                .font(.footnote)
                                                .bold()
                                                .lineLimit(2, reservesSpace: true)
                                            Text(episode.episodeInfo)
                                                .font(.caption)
                                                .foregroundStyle(.secondary)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(3)
                                    }
                                    .padding(5)
                                    .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 10))
                                    .padding(5)
                                    .hoverEffect()
                                    .onTapGesture {
                                        selected = episode
                                    }
                                    .offset(z: selected == episode ? 25 : 0)
                                }
                            }
                        }
                        .safeAreaPadding()
                        .animation(.default, value: selected)
                    }
    
                    if let selected {
                    EpisodeDetail(episode: selected)
                            .padding()
                            .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 10))
                            .padding()
                    }
                }
                .onAppear {
                    if selected == nil, let first = favs.first?.id {
                        selected = vm.logic.getEpisodeBy(id: first)
                    }
                }
            } else {
                Text("There's no favorite episodes yet.")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    FavEpisodesView()
        .environment(BigBangVM.test)
        .modelContainer(testModelContainer)
}


