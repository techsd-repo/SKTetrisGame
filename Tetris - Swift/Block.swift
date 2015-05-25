//
//  Block.swift
//  Tetris - Swift
//
//  Created by TheTechsd on 4/10/15.
//  Copyright (c) 2015 TheTechsd. All rights reserved.
//

import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, Printable {
    
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"

        }
    }


    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
    
}

class Block: Hashable, Printable {
    // #2
    // Constants
    let color: BlockColor
    
    // #3
    // Properties
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    // #4
    var spriteName: String {
        return color.spriteName
    }
    
    // #5
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    // #6
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

// #7
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}


