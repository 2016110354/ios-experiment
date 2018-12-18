//
//  Card.swift
//  实验七
//
//  Created by zhaoru on 2018/11/23.
//  Copyright © 2018年 2016110354. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = -1
    
    static func getUniqueIdentifier() -> Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
