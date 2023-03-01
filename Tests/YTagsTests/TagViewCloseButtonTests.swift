//
//  TagViewCloseButtonTests.swift
//  YTags
//
//  Created by Dev Karan on 28/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YTags

final class TagViewCloseButtonTests: XCTestCase {
    func test_propertiesDefaultValue() {
        let sut = TagView.Appearance.CloseButton.default
        
        XCTAssertEqual(sut.image, Images.xmark.image)
        XCTAssertEqual(sut.size, CGSize(width: 23, height: 23))
        XCTAssertEqual(sut.accessibilityLabel, TagView.Strings.closeButton.localized)
        XCTAssertEqual(sut.tintColor, .label)
    }
    
    func test_propertiesWithCustomValues() throws {
        let image = try XCTUnwrap(UIImage(systemName: "circle"))
        let size = CGSize(width: 33, height: 33)
        let accessibilityLabel = "testing"
        let tintColor = UIColor.red
        
        let sut = TagView.Appearance.CloseButton(
            image: image,
            size: size,
            accessibilityLabel: accessibilityLabel,
            tintColor: tintColor
        )
        XCTAssertEqual(sut.image, image)
        XCTAssertEqual(sut.size, size)
        XCTAssertEqual(sut.accessibilityLabel, accessibilityLabel)
        XCTAssertEqual(sut.tintColor, tintColor)
    }
}
