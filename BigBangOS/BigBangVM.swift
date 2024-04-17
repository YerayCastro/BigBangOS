//
//  BigBangVM.swift
//  BigBangOS
//
//  Created by Yery Castro on 9/12/23.
//

import SwiftUI

// Lógica

@Observable
final class BigBangVM {
    let logic: BigBangLogic
    
    init(logic: BigBangLogic = BigBangLogic()) {
        self.logic = logic
    }
}
