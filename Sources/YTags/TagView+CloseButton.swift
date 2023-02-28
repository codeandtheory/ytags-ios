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
        /// Button image. Default is SF symbol `xmark`.
        var image: UIImage?
        /// Size of close button. Default is {22, 22}.
        var size: CGSize
        /// Accessibility label. Default is `Close`.
        var accessibilityLabel: String
        /// Tint color. Default is `.label`.
        var tintColor: UIColor
        
        /// Default close button
        public static let `default` = CloseButton()
        
        /// Initializes a close button
        /// - Parameters:
        ///   - image: close button image.
        ///   - size: size of close button
        ///   - accessibilityLabel: accessbility label.
        ///   - tintColor: tint color.
        init(
            image: UIImage? = UIImage(systemName: "xmark"),
            size: CGSize = CGSize(width: 22, height: 22),
            accessibilityLabel: String = TagView.Strings.closeButton.localized,
            tintColor: UIColor = .label
        ) {
            self.image = image
            self.size = size
            self.accessibilityLabel = accessibilityLabel
            self.tintColor = tintColor
        }
    }
}
