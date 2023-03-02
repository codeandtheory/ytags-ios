//
//  TagView+Shape.swift
//  YTags
//
//  Created by Dev Karan on 1/03/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import UIKit

extension TagView.Appearance {
    /// Tag shape.
    public enum Shape: Equatable {
        /// Rectangle.
        case rectangle
        /// Rounded rectangle.
        case roundRect(cornerRadius: CGFloat)
        /// Capsule.
        case capsule
    }
}
