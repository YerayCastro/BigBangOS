//
//  BigBangLogic.swift
//  BigBangOS
//
//  Created by Yery Castro on 9/12/23.
//

import SwiftUI

// Para cargar los datos de manera síncrona.

@Observable
final class BigBangLogic {
    let dataInteractor: Interactor
    
    var bigBang: [BigBang]
    
    // Variable que devuelve las todas las temporadas
    var seasons: [Int] {
        Array(Set(bigBang.map(\.season))).sorted()
    }
    
    init(dataInteractor: Interactor = DataInteractor()) {
        self.dataInteractor = dataInteractor
        do {
            self.bigBang = try dataInteractor.loadData()
        } catch {
            self.bigBang = []
            print(error)
        }
    }
    // Función que devuelve los episodios por temporada.
    func episodesBy(season: Int) -> [BigBang] {
        bigBang.filter { bb in
            bb.season == season
        }.sorted { bb1, bb2 in
            bb1.number < bb2.number
        }
    }
    // Función para conseguir los episodios.
    func getEpisodeBy(id: Int) -> BigBang? {
        bigBang.first(where: { $0.id == id })
    }
}
