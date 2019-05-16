//
//  CryptexController.swift
//  Cryptex2
//
//  Created by Jordan Davis on 5/16/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import Foundation

class CryptexController {
    
    init() {
        randomCryptex()
    }
    
    func randomCryptex() {
        let randomCryptex = cryptexes.randomElement()
        currentCryptex = randomCryptex
    }
    
    //MARK: -Properties
    
    private var cryptexes: [Cryptex] = [Cryptex(password: "panther", hint: "Animal guardian spirit of Wakanda"), Cryptex(password: "hillman", hint: "Huxtable family Alma Mater"), Cryptex(password: "ironman", hint: "Defeated Thanos")]
    
    var currentCryptex: Cryptex?
}
