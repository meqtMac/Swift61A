import SystemPackage

#if os(Linux)
import Glibc
#elseif os(macOS)
import Darwin
#else
#error("Un suppported platform, Linux and macOS are supported")
#endif


extension FilePath {
    func isDirectory() throws -> Bool {
        var status = stat()

        let res = self.withPlatformString { pstr in
            // if the file is a symbolic link, then it's link it self rather than the file linked to be stated
            lstat(pstr, &status)
        }

        if res == 0 {
            return (status.st_mode & S_IFMT) == S_IFDIR
        } else {
            throw Errno(rawValue: errno)
        }
    }

    func listdir() throws -> [FilePath] {
        let dir = self.withPlatformString { pstr in
            return opendir(pstr)
        }

        if let dir {
            var files: [FilePath] = []
            var entry = readdir(dir)
            while  entry != nil {
                guard let file = entry?.pointee.d_name else {
                    fatalError()
                }
                let size = MemoryLayout.size(ofValue: file)
                let filePath  = withUnsafePointer(to: file) { ptr in
                    ptr.withMemoryRebound(to: CChar.self, capacity: size) {
                        self.appending(.init(platformString: $0))
                    }
                }
                entry = readdir(dir)
                files.append(filePath)
            }
            return files
        } else {
            throw Errno(rawValue: errno)
        }
            
    }
}

extension FileDescriptor {
    func isDirectory() throws -> Bool {
        var status = stat()

        let res = fstat(self.rawValue, &status)
        if res == 0 {
            return (status.st_mode & S_IFMT) == S_IFDIR 
        } else {
            throw Errno(rawValue: errno) 
        }
    }
}
