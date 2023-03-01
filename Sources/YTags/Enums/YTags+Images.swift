//
//  YTags+Images.swift
//  YTags
//
//  Created by Dev Karan on 1/03/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation
import YCoreUI

/// Collection of Images
enum Images: String, CaseIterable, ImageAsset {
    case xmark
    case circle

    static var bundle: Bundle { .module }
}
