//
//  AppearanceCloseButtonTests.swift
//  YTags
//
//  Created by Dev Karan on 28/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YTags

final class AppearanceCloseButtonTests: XCTestCase {
    func test_propertiesDefaultValue() {
        let sut = TagView.Appearance.CloseButton.default
        
        XCTAssertEqual(sut.image, Images.xmark.image)
        XCTAssertEqual(sut.accessibilityLabel, TagView.Strings.closeButton.localized)
        XCTAssertEqual(sut.tintColor, .label)
    }
    
    func test_propertiesWithCustomValues() throws {
        let image = try XCTUnwrap(UIImage(systemName: "circle"))
        let accessibilityLabel = "testing"
        let tintColor = UIColor.red
        
        let sut = TagView.Appearance.CloseButton(
            image: image,
            accessibilityLabel: accessibilityLabel,
            tintColor: tintColor
        )
        XCTAssertEqual(sut.image, image)
        XCTAssertEqual(sut.accessibilityLabel, accessibilityLabel)
        XCTAssertEqual(sut.tintColor, tintColor)
    }
}
