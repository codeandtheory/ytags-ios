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
    /// A label to display text.
    public let titleLabel: TypographyLabel = {
        let label = TypographyLabel(typography: .systemLabel)
        label.numberOfLines = 0
        return label
    }()
    
    /// An image view to display the optional icon.
    public let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
    }()
    
    private var iconHeight: NSLayoutConstraint?
    private var iconWidth: NSLayoutConstraint?
        
    /// Appearance for `Tag`.
    public var appearance: TagView.Appearance {
        didSet {
            updateViewAppearance()
        }
    }
    
    /// Initializes a tag view.
    /// - Parameters:
    ///   - title: Title
    ///   - appearance: Tag appearance
    public init(title: String, appearance: TagView.Appearance = .default) {
        self.titleLabel.text = title
        self.appearance = appearance
        super.init(frame: .zero)
        
        build()
        updateViewAppearance()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    /// :nodoc:
    required public init?(coder: NSCoder) { nil }
}

private extension TagView {
    func build() {
        buildViews()
        buildConstraints()
    }
    
    func buildViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
    }
    
    func buildConstraints() {
        stackView.constrainEdges(with: appearance.layout.contentInset)
    }
    
    func updateViewAppearance() {
        backgroundColor = appearance.backgroundColor
        layer.borderColor = appearance.borderColor.cgColor
        layer.borderWidth = appearance.borderWidth
        titleLabel.textColor = appearance.title.textColor
        titleLabel.typography = appearance.title.typography
        iconImageView.image = appearance.icon?.image
        iconImageView.isHidden = !appearance.hasIcon
        stackView.spacing = appearance.layout.gap
        if let iconSize = appearance.icon?.size,
           iconHeight == nil {
            let icon = iconImageView.constrainSize(iconSize)
            iconHeight = icon[.height]
            iconWidth = icon[.width]
        } else {
            iconHeight?.constant = appearance.icon?.size.height ?? 0
            iconWidth?.constant = appearance.icon?.size.width ?? 0
        }
        updateCornerRadius()
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = bounds.height * 0.5
    }
}
