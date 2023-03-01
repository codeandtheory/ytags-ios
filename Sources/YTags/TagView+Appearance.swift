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
        /// Leading icon appearance. Default is 'nil` (no leading icon)
        public var icon: LeadingIcon?
        /// Close button appearance. Default is 'nil` (no close button)
        public var closeButton: CloseButton?
        /// Tag view layout properties such as spacing between views. Default is `.default`.
        public var layout: Layout
        
        /// Whether a leading icon is present or not.
        var hasIcon: Bool { icon != nil }
        /// Whether a close button is present or not.
        var hasCloseButton: Bool { closeButton != nil }
        
        /// Default appearance
        public static let `default` = Appearance()
        
        /// Initializes an `Appearance`.
        /// - Parameters:
        ///   - title: Tuple consisting of `textColor` and `typography` for the title label.
        ///   - backgroundColor: Background color.
        ///   - borderColor: Border color.
        ///   - borderWidth: Border width.
        ///   - icon: Leading icon appearance.
        ///   - layout: Tag view layout properties such as spacing between views.
        ///   - closeButton: Close button appearance.
        init(
            title: (textColor: UIColor, typography: Typography) = (.label, .systemLabel),
            backgroundColor: UIColor = .clear,
            borderColor: UIColor = .label,
            borderWidth: CGFloat = 1,
            icon: LeadingIcon? = nil,
            closeButton: CloseButton? = nil,
            layout: Layout = .default
        ) {
            self.title = title
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
            self.borderWidth = borderWidth
            self.icon = icon
            self.closeButton = closeButton
            self.layout = layout
        }
    }
}
