//
//  TagViewAppearanceLayoutTests.swift
//  YTags
//
//  Created by Dev Karan on 23/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YTags

final class TagViewAppearanceLayoutTests: XCTestCase {
    func test_propertiesDefaultValue() {
        let sut = TagView.Appearance.Layout.default
        XCTAssertEqual(
            sut.contentInset,
            NSDirectionalEdgeInsets(topAndBottom: 8, leadingAndTrailing: 16)
        )
        XCTAssertEqual(sut.gap, 8)
    }
    
    func test_propertiesWithCustomValues() {
        let sut = TagView.Appearance.Layout(
            contentInset: NSDirectionalEdgeInsets(topAndBottom: 10, leadingAndTrailing: 20),
            gap: 26
        )
        XCTAssertEqual(sut.contentInset, NSDirectionalEdgeInsets(topAndBottom: 10, leadingAndTrailing: 20))
        XCTAssertEqual(sut.gap, 26)
    }
}
