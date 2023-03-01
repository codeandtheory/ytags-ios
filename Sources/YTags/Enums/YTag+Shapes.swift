//
//  YTag+Shapes.swift
//  YTags
//
//  Created by Dev Karan on 1/03/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Tag view shapes.
public enum TagShapes: Equatable {
    case rectangle
    case roundRect(cornerRadius: CGFloat)
    case capsule
}
