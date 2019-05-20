//
//  String+URL.swift
//  MU
//
//  Created by fadielse on 20/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation

extension String {
    func toUrl() -> URL {
        if let url = URL(string: self) {
            return url
        }
        return URL(fileURLWithPath: "")
    }
}
