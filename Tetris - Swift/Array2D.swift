//
//  Array2D.swift
//  Tetris - Swift
//
//  Created by TheTechsd on 4/10/15.
//  Copyright (c) 2015 TheTechsd. All rights reserved.
//

class Array2D<T> {
    let columns: Int
    let rows: Int
    // #2
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        // #3
        array = Array<T?>(count:rows * columns, repeatedValue: nil)
    }
    
    // #4
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}
