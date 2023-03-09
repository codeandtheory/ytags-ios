//
//  TagView+CloseButton.swift
//  YTags
//
//  Created by Dev Karan on 28/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import UIKit

extension TagView.Appearance {
    /// Tag view close button properties.
    public struct CloseButton {
        /// Button image. Default is `xmark`.
        var image: UIImage
        /// Accessibility label. Default is `Close`.
        var accessibilityLabel: String
        /// Tint color. Default is `.label`.
        var tintColor: UIColor
        
        /// Default close button appearance.
        public static let `default` = CloseButton()
        
        /// Default image
        public static let defaultImage: UIImage = Images.xmark.image
        
        /// Default accessibility label
        public static let defaultAccessibilityLabel: String = TagView.Strings.closeButton.localized
        
        /// Initializes a close button.
        /// - Parameters:
        ///   - image: close button image.
        ///   - accessibilityLabel: accessbility label.
        ///   - tintColor: tint color.
        public init(
            image: UIImage = defaultImage,
            accessibilityLabel label: String = defaultAccessibilityLabel,
            tintColor: UIColor = .label
        ) {
            self.image = image
            self.accessibilityLabel = label.isEmpty ? TagView.Strings.closeButton.localized : label
            self.tintColor = tintColor
        }
    }
}
