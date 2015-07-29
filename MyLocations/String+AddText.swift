//
//  String+AddText.swift
//  MyLocations
//
//  Created by snake on 15/7/29.
//  Copyright (c) 2015年 snakeLib. All rights reserved.
//

import Foundation

extension String {
    mutating func addText(text: String?, withSeparator separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}