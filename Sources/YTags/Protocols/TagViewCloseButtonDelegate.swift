//
//  TagViewCloseButtonDelegate.swift
//  YTags
//
//  Created by Dev Karan on 28/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

internal protocol TagViewCloseButtonDelegate: AnyObject {
    func tagDidClose(_ tag: TagView)
}
