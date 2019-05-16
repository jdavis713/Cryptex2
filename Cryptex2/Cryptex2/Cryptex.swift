//
//  Cryptex.swift
//  Cryptex2
//
//  Created by Jordan Davis on 5/16/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import Foundation

struct Cryptex {
    var password: String
    var hint: String

    init(password: String, hint: String) {
        self.password = password
        self.hint = hint
    }
}
