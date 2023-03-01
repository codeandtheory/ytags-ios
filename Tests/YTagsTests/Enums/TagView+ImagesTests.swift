//
//  TagView+ImagesTests.swift
//  YTags
//
//  Created by Dev Karan on 1/03/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//
import XCTest
@testable import YTags

final class TagViewImagesTests: XCTestCase {
    func test_loadImages() {
        Images.allCases.forEach {
            XCTAssertNotNil($0.loadImage())
        }
    }
}
