//
//  EpisodeDetail.swift
//  BigBangOS
//
//  Created by Yery Castro on 10/12/23.
//

import SwiftUI
import SwiftData

struct EpisodeDetail: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \FavoriteData.id) private var favs: [FavoriteData]
    
    let episode: BigBang
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(episode.name)
                            .font(.title)
                            .bold()
                        Text(episode.episodeInfo)
                            .padding(.bottom)
                    }
                    Spacer()
                    Button {
                        toggleFavorite()
                    } label: {
                        Image(systemName: !isFavorited() ? "star" : "star.fill")
                    }
                    .buttonStyle(.bordered)
                    .hoverEffect()
                }
                Image(episode.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(episode.summary)
                    .padding(.top)
                Text("Runtime: \(episode.runtime) minutes.")
                    .font(.headline)
            }
        }
        .navigationTitle(episode.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    // Función para ver si un episodio es favorito.
    func isFavorited() -> Bool {
        favs.contains(where: { $0.id == episode.id })
    }
    // Función para añadir o borrar episodios favoritos.
    func toggleFavorite() {
        if let fav = favs.first(where: { $0.id == episode.id }) {
            context.delete(fav)
        } else {
            context.insert(FavoriteData(id: episode.id))
        }
    }
}

#Preview {
    EpisodeDetail(episode: .test)
        .modelContainer(testModelContainer)
}
