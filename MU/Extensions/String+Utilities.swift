//
//  String+Utilities.swift
//  MU
//
//  Created by fadielse on 11/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

extension String {
    
    var isEmptyAfterTrim: Bool {
        get {
            return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
        }
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func condensingWhitespace() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}
