//
//  TestUtils.swift
//  USERSFORUM
//
//  Created by Vivek on 17/10/23.
//

import Foundation

// MARK: - Test Utilities
final class TestUtils {
    // Mock data provider
    static func data(forResource resource: String, ext: String = "json") throws -> Data {
        let testBundle = Bundle(for: type(of: TestUtils().self))
        
        guard let url = testBundle.url(forResource: resource, withExtension: ext) else {
            throw NSError(domain: "TEST", code: 0,
                          userInfo: [NSLocalizedDescriptionKey: "No url  found for \(resource).\(ext)"])
        }
        return try Data(contentsOf: url)
    }
}
