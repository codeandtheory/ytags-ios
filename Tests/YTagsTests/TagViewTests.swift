//
//  TagViewTests.swift
//  YTags
//
//  Created by Dev Karan on 23/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YTags

final class TagViewTests: XCTestCase {
    func test_initWithCoder() throws {
        let sut = TagView(coder: try makeCoder(for: UIView()))
        XCTAssertNil(sut)
    }
    
    func test_init_withDefaultValues() {
        let title = "Sample Tag"
        let sut = makeSUT(headerTitle: title)
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.titleLabel.text, title)
    }
    
    func test_init_withDefaultValuesWithIcon() {
        let title = "Sample Tag"
        let sut = makeSUT(
            appearance: TagView.Appearance(icon: .default),
            headerTitle: title
        )
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.titleLabel.text, title)
        XCTAssertEqual(sut.iconImageView.image, sut.appearance.icon?.image)
    }
    
    func test_showIcon() throws {
        let sut = makeSUT(headerTitle: "title")
        let image = try XCTUnwrap(UIImage(systemName: "xmark"))
        let size = CGSize(width: 44, height: 44)
        
        XCTAssertTrue(sut.iconImageView.isHidden)
        sut.appearance = TagView.Appearance(
            icon: TagView.Appearance.LeadingIcon(image: image, size: size)
        )
        sut.layoutIfNeeded()
        
        XCTAssertFalse(sut.iconImageView.isHidden)
        XCTAssertEqual(sut.iconImageView.image, image)
        XCTAssertEqual(sut.iconImageView.bounds.width, size.width)
    }
    
    func test_changeAppearance() throws {
        let sut = makeSUT(headerTitle: "title")
        let backgroundColor: UIColor = .red
        let borderColor: UIColor = .purple
        let borderWidth = CGFloat(Int.random(in: 1...8))
        
        XCTAssertEqual(sut.backgroundColor, .clear)
        sut.appearance.backgroundColor = backgroundColor
        sut.appearance.borderColor = borderColor
        sut.appearance.borderWidth = borderWidth
        
        XCTAssertEqual(sut.backgroundColor, backgroundColor)
        XCTAssertEqual(sut.layer.borderColor, borderColor.cgColor)
        XCTAssertEqual(sut.layer.borderWidth, borderWidth)
    }
    
    func test_closeButton() throws {
        let sut = makeSUT(headerTitle: "title")
        let image = try XCTUnwrap(UIImage(systemName: "xmark"))
        
        XCTAssertTrue(sut.closeButton.isHidden)
        sut.appearance = TagView.Appearance(
            closeButton: TagView.Appearance.CloseButton(image: image)
        )
        sut.layoutIfNeeded()
        
        XCTAssertFalse(sut.closeButton.isHidden)
        XCTAssertEqual(sut.closeButton.imageView?.image, image)
    }
    
    func test_closeButtonTap() {
        let sut = SpyTagView(title: "Testing")
        XCTAssertFalse(sut.didCloseTapped)
        
        sut.simulateTagDidClose()
        
        XCTAssertTrue(sut.didCloseTapped)
    }
    
    func test_changeCloseButtonAppearance() throws {
        let image = try XCTUnwrap(UIImage(systemName: "xmark"))
        let appearance = TagView.Appearance(closeButton: TagView.Appearance.CloseButton(image: image))
        
        let sut = makeSUT(appearance: appearance)
        
        XCTAssertFalse(sut.closeButton.isHidden)
        
        sut.appearance = .default
        
        XCTAssertTrue(sut.closeButton.isHidden)
    }
    
    func test_changeIconAppearance() throws {
        let image = try XCTUnwrap(UIImage(systemName: "xmark"))
        let size = CGSize(width: 44, height: 44)
        
        let appearance = TagView.Appearance(
            icon: TagView.Appearance.LeadingIcon(image: image, size: size)
        )
        
        let sut = makeSUT(appearance: appearance)
        
        XCTAssertFalse(sut.iconImageView.isHidden)
        
        sut.appearance = .default
        
        XCTAssertTrue(sut.iconImageView.isHidden)
    }
}

private extension TagViewTests {
    func makeSUT(
        appearance: TagView.Appearance = .default,
        headerTitle: String = "",
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> TagView {
        let sut = TagView(title: headerTitle, appearance: appearance)
        trackForMemoryLeaks(sut, file: file, line: line)
        return sut
    }
    
    func makeCoder(for view: UIView) throws -> NSCoder {
        let data = try NSKeyedArchiver.archivedData(withRootObject: view, requiringSecureCoding: false)
        return try NSKeyedUnarchiver(forReadingFrom: data)
    }
}

final class SpyTagView: TagView {
    var didCloseTapped = false
    
    override func simulateTagDidClose() {
        super.simulateTagDidClose()
        didCloseTapped = true
    }
}
