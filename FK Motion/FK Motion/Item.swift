//
//  Item.swift
//  FK Motion
//
//  Created by Fredrik Frost on 2019-05-16.
//  Copyright © 2019 SuperNova. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var content: String
    
    init(name: String, content: String) {
        self.name = name;
        self.content = content
        super.init()
    }
}
