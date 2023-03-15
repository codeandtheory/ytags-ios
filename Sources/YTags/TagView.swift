//
//  TagView.swift
//  YTags
//
//  Created by Dev Karan on 23/02/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import UIKit
import YMatterType
import YCoreUI

/// A view that represents a `Tag`.
open class TagView: UIView {
    /// An image view to display the optional icon.
    public let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.constrainAspectRatio(1)
        return imageView
    }()
    
    /// A label to display text.
    public let titleLabel: TypographyLabel = {
        let label = TypographyLabel(typography: .systemLabel)
        label.numberOfLines = 0
        return label
    }()
    
    /// An optional close button.
    let closeButton: UIButton = {
        let button = UIButton()
        button.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.constrainAspectRatio(1)
        return button
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()

    /// Close button delegate.
    weak var delegate: TagViewDelegate?
    
    // Constraints
    private var iconHeight: NSLayoutConstraint?
    private var closeButtonHeight: NSLayoutConstraint?

    /// Appearance for `Tag`.
    public var appearance: TagView.Appearance {
        didSet {
            updateViewAppearance()
        }
    }
    
    /// Initializes a tag view.
    /// - Parameters:
    ///   - title: title.
    ///   - appearance: tag appearance.
    public init(title: String, appearance: TagView.Appearance = .default) {
        self.titleLabel.text = title
        self.appearance = appearance
        super.init(frame: .zero)
        
        build()
        updateViewAppearance()
    }

    /// :nodoc:
    required public init?(coder: NSCoder) { nil }

    /// :nodoc:
    open override func layoutSubviews() {
        super.layoutSubviews()

        updateShape()
    }

    /// Adjusts image sizes and border width based on trait changes
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.hasDifferentFontAppearance(comparedTo: previousTraitCollection) {
            updateViewAppearance()
        } else if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateBorderColor()
        }
    }

    /// Unit testing
    internal func simulateTagDidClose() {
        tagDidClose()
    }
}

private extension TagView {
    func build() {
        buildViews()
        buildConstraints()
        setupCloseButton()
    }
    
    func buildViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(closeButton)
    }
    
    func buildConstraints() {
        stackView.constrainEdges(with: appearance.layout.contentInset)

        // The icons (leading and trailing) shouldn't exceed the scaled line height of the label
        iconHeight = iconImageView.constrain(
            .heightAnchor,
            relatedBy: .lessThanOrEqual,
            constant: appearance.title.typography.lineHeight
        )
        closeButtonHeight = closeButton.constrain(
            .heightAnchor,
            relatedBy: .lessThanOrEqual,
            constant: appearance.title.typography.lineHeight
        )
    }
    
    func setupCloseButton() {
        closeButton.addTarget(self, action: #selector(tagDidClose), for: .touchUpInside)
        closeButton.accessibilityIdentifier = AccessibilityIdentifiers.buttonId
    }
    
    func updateViewAppearance() {
        backgroundColor = appearance.backgroundColor
        layer.borderWidth = appearance.borderWidth(compatibleWith: traitCollection)
        titleLabel.textColor = appearance.title.textColor
        titleLabel.typography = appearance.title.typography
        stackView.spacing = appearance.layout.gap
        updateBorderColor()
        updateIcon()
        updateCloseButton()
        updateShape()
        updateHeights()
        updateAccessibilityElements()
    }
    
    func updateBorderColor() {
        layer.borderColor = appearance.borderColor.cgColor
    }
    
    func updateIcon() {
        iconImageView.image = appearance.icon?.image
        iconImageView.isHidden = !appearance.hasIcon
        iconImageView.tintColor = appearance.icon?.tintColor
    }
    
    func updateCloseButton() {
        closeButton.isHidden = !appearance.hasCloseButton
        closeButton.tintColor = appearance.closeButton?.tintColor
        closeButton.setImage(appearance.closeButton?.image, for: .normal)
        closeButton.accessibilityLabel = appearance.closeButton?.accessibilityLabel
    }

    func updateHeights() {
        let layout = appearance.title.typography.generateLayout(compatibleWith: traitCollection)
        iconHeight?.constant = layout.lineHeight
        closeButtonHeight?.constant = layout.lineHeight
    }
    
    func updateShape() {
        switch appearance.shape {
        case .capsule:
            layer.cornerRadius = bounds.height * 0.5
        case .rectangle:
            layer.cornerRadius = 0
        case .roundRect(let radius):
            layer.cornerRadius = radius
        }
    }

    func updateAccessibilityElements() {
        var accessibilityElements: [Any]? = [titleLabel]

        if appearance.hasCloseButton {
            accessibilityElements?.append(closeButton)
        }

        self.accessibilityElements = accessibilityElements
    }
    
    @objc func tagDidClose() {
        delegate?.tagDidClose(self)
    }
}
