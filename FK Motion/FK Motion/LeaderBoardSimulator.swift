//
//  LeaderBoardSimulator.swift
//  FK Motion
//
//  Created by Fredrik Frost on 2019-05-16.
//  Copyright © 2019 SuperNova. All rights reserved.
//

import UIKit

class LeardBoardSimulator {
    
    var leaderBoard = [TableElement]()
    
    init() {
        var personInfo = TableElement(title: "Dennis Nilsson", matvarde: "1337")
        leaderBoard.append(personInfo)
        personInfo = TableElement(title: "Fredrik Frost", matvarde: "1336")
        leaderBoard.append(personInfo)
        personInfo = TableElement(title: "Lars Kallin", matvarde: "1335")
        leaderBoard.append(personInfo)

    }
    
    @discardableResult func getLeaderBoard() -> [TableElement] {
        
//        let steg = TableElement(title: "Dennis Nilsson", matvarde: "Antal steg: 1337")
//        var allTableElements = [TableElement]()
//        allTableElements.append(steg)
//        let steg2 = TableElement(title: "Fredrik Frost", matvarde: "Antal steg: 1336")
//        allTableElements.append(steg2)
        
        print("getLeaderBoard")
        for person in leaderBoard {
            let nyttVarde = Int(person.matvarde)! + Int.random(in: 0 ..< 200)
            print(person.matvarde + " " + String(nyttVarde))
            person.matvarde = String(nyttVarde)
        }
        
        return leaderBoard
    }
    
}
