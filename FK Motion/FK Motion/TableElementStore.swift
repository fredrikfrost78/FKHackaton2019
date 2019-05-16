//
//  TableElementStore.swift
//  FK Motion
//
//  Created by Fredrik Frost on 2019-05-16.
//  Copyright © 2019 SuperNova. All rights reserved.
//

import UIKit

class TableElementStore {
    var allTableElements = [TableElement]()
    init() {
        let steg = TableElement(title: "Steg", matvarde: 1337)
        
        allTableElements.append(steg)
    }
}
