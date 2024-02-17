import Foundation

final class MockFileManager: FileManager {
  // Dictionary to hold mock file existence state
  var fileExistsMock: [String: Bool] = [:]
  
  // Dictionary to simulate directories
  var directories: Set<String> = []
  
  override func fileExists(atPath path: String) -> Bool {
    // Return the mocked existence state, defaulting to false if not set
    return fileExistsMock[path] ?? false
  }
  
  override func createDirectory(
    atPath path: String,
    withIntermediateDirectories createIntermediates: Bool,
    attributes: [FileAttributeKey : Any]? = nil
  ) throws {
    // Simply add the path to the directories set to simulate creation
    // In a real test, you might want to throw an error under certain conditions to test error handling
    directories.insert(path)
  }
  
  // Mock method to set file existence state in tests
  func setFileExists(_ exists: Bool, atPath path: String) {
    fileExistsMock[path] = exists
  }
  
  // Helper method to check if a directory was "created"
  func didCreateDirectory(atPath path: String) -> Bool {
    return directories.contains(path)
  }
}

// MARK: testing example
//func testDirectoryCreation() {
//  let mockFileManager = MockFileManager()
//  let path = "/path/to/directory"
//  
//  // Initially, the directory should not "exist"
//  XCTAssertFalse(mockFileManager.fileExists(atPath: path))
//  
//  // Simulate creating the directory
//  try? mockFileManager.createDirectory(atPath: path, withIntermediateDirectories: true)
//  
//  // Now, the directory should "exist"
//  XCTAssertTrue(mockFileManager.didCreateDirectory(atPath: path))
//}
//
//func testFileExistenceCheck() {
//  let mockFileManager = MockFileManager()
//  let existingFilePath = "/path/to/existingFile.txt"
//  let nonExistingFilePath = "/path/to/nonExistingFile.txt"
//  
//  // Set up mock file existence state
//  mockFileManager.setFileExists(true, atPath: existingFilePath)
//  
//  // Check that the fileExists method returns the mocked values
//  XCTAssertTrue(mockFileManager.fileExists(atPath: existingFilePath))
//  XCTAssertFalse(mockFileManager.fileExists(atPath: nonExistingFilePath))
//}
//
