//
//  StringExtensions.swift
//  USERSFORUM
//
//  Created by Vivek on 15/10/23.
//

import Foundation

extension String {
    // MARK: - Localized String
    var localized: Self {
        NSLocalizedString(self, comment: self)
    }
}
