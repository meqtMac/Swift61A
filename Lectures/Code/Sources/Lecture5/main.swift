//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/10.
//

import Foundation

/**
 # Environments
 using lldb frame variable and backtracing tools
 */

func twice(f: (Int) -> Int, x: Int) -> Int {
    f(f(x))
}

func square(x: Int) -> Int {
    x * x
}

let res = twice(f: square, x: 2)
