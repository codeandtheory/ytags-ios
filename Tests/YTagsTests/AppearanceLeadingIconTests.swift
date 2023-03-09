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
        XCTAssertEqual(sut.tintColor, .label)
    }
    
    func test_propertiesWithCustomValues() throws {
        let image = try XCTUnwrap(UIImage(systemName: "circle"))
        let tintColor = UIColor.red
        
        let sut = TagView.Appearance.LeadingIcon(
            image: image,
            tintColor: tintColor
        )
        XCTAssertEqual(sut.image, image)
        XCTAssertEqual(sut.tintColor, tintColor)
    }
}
