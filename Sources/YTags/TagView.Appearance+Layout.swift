//
//  TagView.Appearance+Layout.swift
//  YTags
//
//  Created by Dev Karan on 23/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import UIKit

extension TagView.Appearance {
    /// A collection of layout properties for the `TagView`.
    public struct Layout: Equatable {
        /// The content inset from edges.
        /// Default is `{8, 16, 8, 16}`.
        public var contentInset: NSDirectionalEdgeInsets
        /// The minimum required horizontal spacing between icon and label. Default is `8.0`.
        public var gap: CGFloat
        
        /// Default tag view layout
        public static let `default` = Layout()
        
        /// Initializes a `Layout`.
        /// - Parameters:
        ///   - contentInset: content inset from edges.
        ///   - gap: horizontal spacing between icon and label.
        public init(
            contentInset: NSDirectionalEdgeInsets =
            NSDirectionalEdgeInsets(topAndBottom: 8, leadingAndTrailing: 16),
            gap: CGFloat = 8
        ) {
            self.contentInset = contentInset
            self.gap = gap
        }
    }
}
