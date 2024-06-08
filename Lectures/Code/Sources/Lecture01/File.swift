//
//  Resource.swift
//
//
//  Created by 蒋艺 on 2024/6/8.
//

import SystemPackage

let shakespeara: () -> String = {
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
        return ""
    }
}
