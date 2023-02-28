//
//  TagView+Appearance.swift
//  YTags
//
//  Created by Dev Karan on 23/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import UIKit
import YMatterType

extension TagView {
    /// Determines the appearance of the tag view.
    public struct Appearance {
        /// A tuple consisting of `textColor` and `typography` for the title label.
        /// Default is `(.label, .systemLabel)`.
        public var title: (textColor: UIColor, typography: Typography)
        /// Tag view background color. Default is `.clear`.
        public var backgroundColor: UIColor
        /// Border color. Default is `.label`.
        public var borderColor: UIColor
        /// border width. Default is `1`.
        public var borderWidth: CGFloat
        /// A tuple consisting of 'Image` and 'size` for left icon.
        /// Default is `nil`.
        public var icon: (image: UIImage, size: CGSize)?
        /// Tag view layout properties such as spacing between views. Default is `.default`.
        public var layout: Layout
        
        /// Leading icon is present or not.
        var hasIcon: Bool { icon != nil }
        
        /// Default appearance
        public static let `default` = Appearance()
        
        /// Initializes an `Appearance`.
        /// - Parameters:
        ///   - title: Tuple consisting of `textColor` and `typography` for the title label.
        ///   - backgroundColor: Background color.
        ///   - borderColor: Border color.
        ///   - borderWidth: Border width.
        ///   - icon: A tuple consisting of 'Image` and 'size` for left icon.
        ///   - layout: Tag view layout properties such as spacing between views.
        init(
            title: (textColor: UIColor, typography: Typography) = (.label, .systemLabel),
            backgroundColor: UIColor = .clear,
            borderColor: UIColor = .label,
            borderWidth: CGFloat = 1,
            icon: (image: UIImage, size: CGSize)? = nil,
            layout: Layout = .default
        ) {
            self.title = title
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
            self.borderWidth = borderWidth
            self.icon = icon
            self.layout = layout
        }
    }
}
