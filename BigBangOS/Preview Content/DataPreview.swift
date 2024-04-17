//
//  DataPreview.swift
//  BigBangOS
//
//  Created by Yery Castro on 9/12/23.
//

import Foundation

/*:
  Crear el interactor para manejar los datos de prueba.
 */

// url de test
struct TestInteractor: Interactor {
    // 1º. Obtención de la url del json
    let urlBundle = Bundle.main.url(forResource: "BigBangTest", withExtension: "json")!
    // 3º. Acceso a la carpeta de documentos general,para poder editar los datos. Se añade al path: scoresdata.json
    let docURL = URL.documentsDirectory.appending(path: "BigBangTest.json")
}

extension BigBang {
    static let test = BigBang(id: 2913,
                              name: "Pilot",
                              image: "12368",
                              runtime: 30,
                              season: 1,
                              number: 1,
                              summary: "Is a comedy about brilliant physicists, Leonard and Sheldon, who are the kind of \"beautiful minds\" that understand how the universe works. But none of that genius helps them interact with people, especially women. All this begins to change when a free-spirited beauty named Penny moves in next door. Sheldon, Leonard's roommate, is quite content spending his nights playing Klingon Boggle with their socially dysfunctional friends, fellow Cal Tech scientists Wolowitz and Koothrappali. However, Leonard sees in Penny a whole new universe of possibilities... including love.\n")
}

extension BigBangVM {
    static let test = BigBangVM(logic: BigBangLogic(dataInteractor: TestInteractor()))
}
