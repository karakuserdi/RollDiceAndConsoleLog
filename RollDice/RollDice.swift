//
//  RollDice.swift
//  RollDice
//
//  Created by riza erdi karakus on 14.03.2022.
//

import Foundation

class RollDice {
    var max:Int = 0
    var last:Int = 0

    init(max: Int) {
        self.max = max
        
        let timeStamp = Int(1000 * Date().timeIntervalSince1970)
        last = timeStamp % max
    }
    
    func nextInt() -> Int{
        last = (last * 32719 + 3) % 32749
        return (last % max) + 1
    }
}


