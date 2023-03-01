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
        /// Corner radius will be `0`.
        case rectangle
        /// Corner radius will be the value we are passing.
        case roundRect(cornerRadius: CGFloat)
        /// Corner radius will be half the height of view.
        case capsule
    }
}
