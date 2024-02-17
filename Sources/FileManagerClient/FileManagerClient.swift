import Dependencies
import DependenciesMacros
import Foundation

extension DependencyValues {
  public var fileManager: FileManagerClient {
    get { self[FileManagerClient.self] }
    set { self[FileManagerClient.self] = newValue }
  }
}

@DependencyClient
public struct FileManagerClient: Sendable {
  static let unimplemented = Self()
  
  public var getDefault: @Sendable () -> FileManager = { .default }
  
}
extension FileManagerClient {
  public var `default`: FileManager {
    self.getDefault()
  }
}

extension FileManagerClient: TestDependencyKey {
  public static let testValue: FileManagerClient = {
    
    return Self(
      getDefault: {
        MockFileManager()
      }
    )
  }()
  
  public static var previewValue: FileManagerClient {
    return .testValue
  }
}

extension FileManagerClient: DependencyKey {
  public static let liveValue: FileManagerClient = {
    return Self(
      getDefault: {
        FileManager.default
      }
    )
  }()
}
