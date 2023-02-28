//
//  TagViewAppearanceTests.swift
//  YTags
//
//  Created by Dev Karan on 23/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
import YMatterType
@testable import YTags

final class TagViewAppearanceTests: XCTestCase {
    func test_init_propertiesDefaultValue() {
        let sut = TagView.Appearance.default
        XCTAssertEqual(sut.layout, .default)
        XCTAssertEqual(sut.title.textColor, .label)
        XCTAssertEqual(sut.title.typography.fontFamily.familyName, Typography.systemFamily.familyName)
        XCTAssertEqual(sut.borderWidth, 1)
        XCTAssertEqual(sut.borderColor, .label)
        XCTAssertEqual(sut.backgroundColor, .clear)
        XCTAssertEqual(sut.layout, .default)
        XCTAssertNil(sut.icon)
        XCTAssertFalse(sut.hasIcon)
    }
}
