//
//  File.swift
//  
//
//  Created by Daniel Lyons on 2/3/24.
//

import Foundation

extension FileManager {
  public func userDocumentsDir() throws -> URL {
    return try self.url(
      for: .documentDirectory,
      in: .userDomainMask,
      appropriateFor: nil,
      create: true
    )
  }
}
