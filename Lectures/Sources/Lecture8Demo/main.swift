//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/6/17.
//

import Lecture8
let partions = countPartion(n: 6, m: 4)

// use lldb to show stack trace

// there is a good example to reuse the keynotes
//StackTrace.traceFib(n: 2)
//print("---")
//StackTrace.traceFib(n: 3)
//print("---")
//StackTrace.traceFib(n: 4)
//





partions.forEach { partion in
    print(partion )
}

StackTrace.traceCountPartition(n: 6, m: 4)



