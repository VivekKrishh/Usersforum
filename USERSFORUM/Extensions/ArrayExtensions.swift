//
//  ArrayExtensions.swift
//  USERSFORUM
//
//  Created by Vivek on 13/10/23.
//

import Foundation

public extension Array {
    
    //MARK: Element at given index if exists
    /// - Parameter index: index of element
    /// - Returns optional element (if exists)
    
    func  item(at index: Int) -> Element? {
        guard startIndex ..< endIndex ~= index else { return nil }
        return self[index]
    }
    
    //MARK: Insert Element at the beginning
    /// - Parameter newElement: element to insert
    
    mutating func prepend(_ newElement: Element) {
        insert(newElement, at: 0)
    }
    
}

//extension Array where Element: AnyObject , Element: Equatable {
//
//    mutating func remove(_ object: Element) {
//        if let index = firstIndex(where: { $0 === object }) {
//            self.remove(at: index)
//        }
//    }
//
//}

extension Array where Element: Equatable , Element: Any {
    //MARK: This method is used to remove the element from the array of elements
    /// - Parameter element: element to be removed
    mutating func remove(element: Element) {
        if let i = self.firstIndex(of: element) {
            self.remove(at: i)
        }
    }
    
}
