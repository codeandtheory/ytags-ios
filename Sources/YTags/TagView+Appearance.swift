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
        /// Leading icon appearance. Default is 'nil` (no leading icon).
        public var icon: LeadingIcon?
        /// Close button appearance. Default is 'nil` (no close button).
        public var closeButton: CloseButton?
        /// Tag view layout properties such as spacing between views. Default is `.default`.
        public var layout: Layout
        /// Tag shape. Default is `.capsule`.
        public var shape: Shape
        
        /// Whether a leading icon is present or not.
        var hasIcon: Bool { icon != nil }
        /// Whether a close button is present or not.
        var hasCloseButton: Bool { closeButton != nil }
        
        /// Default appearance.
        public static let `default` = Appearance()
        
        /// Initializes an `Appearance`.
        /// - Parameters:
        ///   - title: tuple consisting of `textColor` and `typography` for the title label.
        ///   - backgroundColor: background color.
        ///   - borderColor: border color.
        ///   - borderWidth: border width.
        ///   - icon: leading icon appearance.
        ///   - closeButton: close button appearance.
        ///   - shape: Tag shape.
        ///   - layout: tag view layout properties such as spacing between views.
        public init(
            title: (textColor: UIColor, typography: Typography) = (.label, .systemLabel),
            backgroundColor: UIColor = .clear,
            borderColor: UIColor = .label,
            borderWidth: CGFloat = 1,
            icon: LeadingIcon? = nil,
            closeButton: CloseButton? = nil,
            shape: Shape = .capsule,
            layout: Layout = .default
        ) {
            self.title = title
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
            self.borderWidth = borderWidth
            self.icon = icon
            self.closeButton = closeButton
            self.shape = shape
            self.layout = layout
        }
    }
}
