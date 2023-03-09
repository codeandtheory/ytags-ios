//
//  TagView+LeadingIcon.swift
//  YTags
//
//  Created by Dev Karan on 01/03/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import UIKit

extension TagView.Appearance {
    /// Tag view leading icon properties.
    public struct LeadingIcon {
        /// Leading image.
        var image: UIImage
        /// Tint color. Default is `.label`.
        var tintColor: UIColor
                
        /// Initializes a leading icon.
        /// - Parameters:
        ///   - image: leading image.
        ///   - tintColor: tint color.
        public init(
            image: UIImage,
            tintColor: UIColor = .label
        ) {
            self.image = image
            self.tintColor = tintColor
        }
    }
}
