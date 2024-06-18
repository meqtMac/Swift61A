//
//  Resource.swift
//
//
//  Created by 蒋艺 on 2024/6/8.
//

import SystemPackage
import Logging

// we need to create a logger, the label works similarly to a DispatchQueue label
let logger = Logger(label: "org.swift61a.lecture01")

public let shakespeara: () -> String = {
    let filePath = FilePath(#filePath)
        .removingLastComponent()
        .removingLastComponent()
        .removingLastComponent()
        .appending("Resources")
        .appending("Lecture01")
        .appending("shapespeara.txt")
    
    do {
        let fd = try FileDescriptor.open(filePath, .readOnly)
        return try fd.closeAfter {
            let byteSize = try fd.seek(offset: 0, from: .end)
            try fd.seek(offset: 0, from: .start)
            return try String(unsafeUninitializedCapacity: Int(byteSize)) { buffer in
                try fd.read(into: .init(buffer), retryOnInterrupt: true)
            }
        }
    } catch {
        logger.error("\(error)")
        return ""
    }
}
