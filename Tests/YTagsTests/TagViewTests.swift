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
        XCTAssertTrue(sut.iconImageView.isHidden)
        XCTAssertTrue(sut.closeButton.isHidden)
    }
    
    func test_init_withDefaultValuesWithIcon() throws {
        let title = "Sample Tag"
        let image = try XCTUnwrap(UIImage(systemName: "cube"))
        
        let sut = makeSUT(
            appearance: TagView.Appearance(icon: TagView.Appearance.LeadingIcon(image: image)),
            headerTitle: title
        )
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.titleLabel.text, title)
        XCTAssertEqual(sut.iconImageView.image, sut.appearance.icon?.image)
    }
    
    func test_showIcon() throws {
        let sut = makeSUT(headerTitle: "title")
        let image = try XCTUnwrap(UIImage(systemName: "xmark"))

        XCTAssertTrue(sut.iconImageView.isHidden)
        sut.appearance = TagView.Appearance(
            icon: TagView.Appearance.LeadingIcon(image: image)
        )
        sut.layoutIfNeeded()
        
        XCTAssertFalse(sut.iconImageView.isHidden)
        XCTAssertEqual(sut.iconImageView.image, image)
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

        let appearance = TagView.Appearance(
            icon: TagView.Appearance.LeadingIcon(image: image)
        )
        
        let sut = makeSUT(appearance: appearance)
        
        XCTAssertFalse(sut.iconImageView.isHidden)
        
        sut.appearance = .default
        
        XCTAssertTrue(sut.iconImageView.isHidden)
    }

    func test_rectangeShape() {
        let sut = makeSUT()
        sut.appearance.shape = .rectangle
        sut.layoutIfNeeded()
        
        XCTAssertEqual(sut.layer.cornerRadius, 0)
        XCTAssertEqual(sut.appearance.shape, .rectangle)
    }
    
    func test_customShape() {
        let sut = makeSUT()
        let cornerRadius: CGFloat = 13
        sut.appearance.shape = .roundRect(cornerRadius: cornerRadius)
        
        sut.layoutIfNeeded()
        
        XCTAssertEqual(sut.layer.cornerRadius, cornerRadius)
        XCTAssertEqual(sut.appearance.shape, .roundRect(cornerRadius: cornerRadius))
    }
    
    func test_defaultShape() {
        let sut = makeSUT()
        sut.layoutIfNeeded()
        
        XCTAssertEqual(sut.layer.cornerRadius, sut.bounds.height * 0.5)
        XCTAssertEqual(sut.appearance.shape, .capsule)
    }

    func test_increaseLegibilityWeight_thickensBorder() {
        // Given
        let sut = makeSUT()
        let oldBorderWidth = sut.layer.borderWidth
        let (parent, child) = makeNestedViewControllers(subview: sut)

        // When
        let traits = UITraitCollection(legibilityWeight: .bold)
        parent.setOverrideTraitCollection(traits, forChild: child)
        sut.traitCollectionDidChange(traits)

        // Then
        XCTAssertEqual(sut.layer.borderWidth, oldBorderWidth + 1)
    }
    
    func test_updatedColorMode_changesBorderColor() {
        // Given
        let sut = makeSUT()
        let darkBorderColor  = UIColor.white
        let lightBorderColor = UIColor.black
        let (parent, child) = makeNestedViewControllers(subview: sut)
        
        // When
        let traitDark = UITraitCollection(userInterfaceStyle: .dark)
        parent.setOverrideTraitCollection(traitDark, forChild: child)
        sut.traitCollectionDidChange(traitDark)
        sut.appearance.borderColor = darkBorderColor
        
        // Then
        XCTAssertEqual(sut.layer.borderColor, darkBorderColor.cgColor)
        
        // When
        let traitLight = UITraitCollection(userInterfaceStyle: .light)
        parent.setOverrideTraitCollection(traitLight, forChild: child)
        sut.traitCollectionDidChange(traitLight)
        sut.appearance.borderColor = lightBorderColor
        
        // Then
        XCTAssertEqual(sut.layer.borderColor, lightBorderColor.cgColor)
    }

    func test_accessibilityElements() {
        // Given
        let sut = makeSUT()
        XCTAssertEqual(sut.accessibilityElements?.count, 1)

        // When
        sut.appearance = TagView.Appearance(closeButton: .default)

        // Then
        XCTAssertEqual(sut.accessibilityElements?.count, 2)
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
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
    
    func makeCoder(for view: UIView) throws -> NSCoder {
        let data = try NSKeyedArchiver.archivedData(withRootObject: view, requiringSecureCoding: false)
        return try NSKeyedUnarchiver(forReadingFrom: data)
    }

    /// Create nested view controllers containing the view to be tested so that we can override traits
    func makeNestedViewControllers(
        subview: UIView,
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (parent: UIViewController, child: UIViewController) {
        let parent = UIViewController()
        let child = UIViewController()
        parent.addChild(child)
        parent.view.addSubview(child.view)

        // constrain child controller view to parent
        child.view.constrainEdges()

        child.view.addSubview(subview)

        // constrain subview to child view center
        subview.constrainCenter()

        trackForMemoryLeak(parent, file: file, line: line)
        trackForMemoryLeak(child, file: file, line: line)

        return (parent, child)
    }
}

final class SpyTagView: TagView {
    var didCloseTapped = false
    
    override func simulateTagDidClose() {
        super.simulateTagDidClose()
        didCloseTapped = true
    }
}
