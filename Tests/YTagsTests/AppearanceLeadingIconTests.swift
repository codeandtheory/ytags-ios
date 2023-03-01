//
//  AppearanceLeadingIconTests.swift
//  YTags
//
//  Created by Dev Karan on 01/03/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YTags

final class AppearanceLeadingIconTests: XCTestCase {
    func test_propertiesDefaultValue() throws {
        let image = try XCTUnwrap(UIImage(systemName: "cube"))
        
        let sut = TagView.Appearance.LeadingIcon(image: image)
        
        XCTAssertEqual(sut.image, image)
        XCTAssertEqual(sut.size, CGSize(width: 23, height: 23))
        XCTAssertEqual(sut.tintColor, .label)
    }
    
    func test_propertiesWithCustomValues() throws {
        let image = try XCTUnwrap(UIImage(systemName: "circle"))
        let size = CGSize(width: 33, height: 33)
        let tintColor = UIColor.red
        
        let sut = TagView.Appearance.LeadingIcon(
            image: image,
            size: size,
            tintColor: tintColor
        )
        XCTAssertEqual(sut.image, image)
        XCTAssertEqual(sut.size, size)
        XCTAssertEqual(sut.tintColor, tintColor)
    }
}
