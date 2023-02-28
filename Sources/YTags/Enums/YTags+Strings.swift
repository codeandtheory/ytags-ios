//
//  YTags+Strings.swift
//  YTags
//
//  Created by Dev Karan on 28/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation
import YCoreUI

extension TagView {
    enum Strings: String, Localizable, CaseIterable {
        case closeButton = "Close_Button"
        
        static var bundle: Bundle { .module }
    }
}
