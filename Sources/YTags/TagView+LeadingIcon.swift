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
        /// Size of leading image. Default is {23, 23}.
        var size: CGSize
        /// Tint color. Default is `.label`.
        var tintColor: UIColor
                
        /// Initializes a leading icon.
        /// - Parameters:
        ///   - image: leading image.
        ///   - size: size of leading image.
        ///   - tintColor: tint color.
        init(
            image: UIImage,
            size: CGSize = CGSize(width: 23, height: 23),
            tintColor: UIColor = .label
        ) {
            self.image = image
            self.size = size
            self.tintColor = tintColor
        }
    }
}
