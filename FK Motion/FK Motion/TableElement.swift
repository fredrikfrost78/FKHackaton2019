//
//  TableElement.swift
//  FK Motion
//
//  Created by Fredrik Frost on 2019-05-16.
//  Copyright © 2019 SuperNova. All rights reserved.
//

import UIKit

class TableElement: NSObject {
    var title: String
    var matvarde: Int
    
    init(title: String, matvarde: Int) {
        self.title = title;
        self.matvarde = matvarde
        super.init()
    }
}
