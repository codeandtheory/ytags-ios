//
//  YTags+Images.swift
//  YTags
//
//  Created by Dev Karan on 1/03/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import UIKit
import YCoreUI

/// Collection of Images
enum Images: String, CaseIterable {
    case xmark
}

extension Images: ImageAsset {
    public func loadImage() -> UIImage? {
        UIImage(systemName: rawValue)
    }
}