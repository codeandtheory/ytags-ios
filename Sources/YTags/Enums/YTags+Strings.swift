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
    /// Accessibility strings
    public enum Strings: String, Localizable, CaseIterable {
        /// CloseButton
        case closeButton = "Close_Button"
        
        /// Bundle
        public static var bundle: Bundle { .module }
    }
}
