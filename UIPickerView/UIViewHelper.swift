//
//  UIViewHelper.swift
//  UIPickerView
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 6.09.2022.
//

import Foundation
import UIKit

enum Alignment {
    case leadingAlignment
    case topAlignment
    case trailingAlignment
    case bottomAlignment
    case topLeadingAlignment
    case topTrailingAlignment
    case bottomLeadingAlignment
    case bottomTrailingAlignment
    case centerAlignment
}


extension UIView {
//    fileprivate
    func stack(_ axis: NSLayoutConstraint.Axis = .vertical,
                views: [UIView],
                spacing: CGFloat = 0,
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill
                
    ) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.alignment = alignment
        addSubview(stackView)
        return stackView
    }
    @discardableResult
    func vStack(_ views: UIView... ,
                spacing:CGFloat = 0,
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        return stack(.vertical,
                     views: views,
                     spacing: spacing,
                     alignment: alignment,
                     distribution: distribution)
    }
    @discardableResult
    func hStack(_ views: UIView... ,
                spacing:CGFloat = 0,
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        return stack(.horizontal,
                     views: views,
                     spacing: spacing,
                     alignment: alignment,
                     distribution: distribution)
    }
    
    @discardableResult
    func fill(content:UIView ,padding: UIEdgeInsets? = nil) -> Self {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: content.leadingAnchor,constant: padding?.left ?? 0),
            trailingAnchor.constraint(equalTo: content.trailingAnchor,constant: -(padding?.right ?? 0)),
            topAnchor.constraint(equalTo: content.topAnchor,constant: padding?.top ?? 0),
            bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -(padding?.bottom ?? 0))
        ])
        return self
    }
    @discardableResult
    func widthAndHeight(width:CGFloat = 0, height:CGFloat = 0) -> Self {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height)
        ])
        return self
    }
    
    @discardableResult
    func elasticWidthAndHeight(width:CGFloat = 0, height:CGFloat = 0) -> Self {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height)
        ])
        return self
    }
//    paddingler kontrol edilmeli
    func contentAlginment(content:UIView, alignment: Alignment,
                          padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) ) -> Self {
        switch alignment {
        case .leadingAlignment:
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: padding.left),
                centerYAnchor.constraint(equalTo: content.centerYAnchor),
                topAnchor.constraint(greaterThanOrEqualTo: content.topAnchor, constant: padding.top),
                trailingAnchor.constraint(lessThanOrEqualTo: content.trailingAnchor, constant: -padding.right),
                bottomAnchor.constraint(lessThanOrEqualTo: content.bottomAnchor, constant: -padding.bottom)
            ])
            return self
        case .topAlignment:
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(greaterThanOrEqualTo: content.leadingAnchor, constant: padding.left),
                centerXAnchor.constraint(equalTo: content.centerXAnchor),
                topAnchor.constraint(equalTo: content.topAnchor, constant: padding.top),
                trailingAnchor.constraint(lessThanOrEqualTo: content.trailingAnchor, constant: -padding.right),
                bottomAnchor.constraint(lessThanOrEqualTo: content.bottomAnchor, constant: -padding.bottom)
            ])
            return self
        case .trailingAlignment:
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(greaterThanOrEqualTo: content.leadingAnchor, constant: padding.left),
                centerYAnchor.constraint(equalTo: content.centerYAnchor),
                topAnchor.constraint(greaterThanOrEqualTo: content.topAnchor, constant: -padding.top),
                trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -padding.right),
                bottomAnchor.constraint(lessThanOrEqualTo: content.bottomAnchor, constant: -padding.bottom)
            ])
            return self
        case .bottomAlignment:
            NSLayoutConstraint.activate([
                centerXAnchor.constraint(equalTo: content.centerXAnchor),
                leadingAnchor.constraint(greaterThanOrEqualTo: content.leadingAnchor, constant: -padding.left),
                topAnchor.constraint(greaterThanOrEqualTo: content.topAnchor, constant: -padding.top),
                trailingAnchor.constraint(lessThanOrEqualTo: content.trailingAnchor, constant: padding.right),
                bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -padding.bottom)
            ])
            return self
        case .topLeadingAlignment:
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: padding.left),
                topAnchor.constraint(equalTo: content.topAnchor, constant: padding.top),
                trailingAnchor.constraint(lessThanOrEqualTo: content.trailingAnchor, constant: padding.right),
                bottomAnchor.constraint(lessThanOrEqualTo: content.bottomAnchor, constant: padding.bottom)
            ])
            return self
        case .topTrailingAlignment:
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(greaterThanOrEqualTo: content.leadingAnchor, constant: padding.left),
                topAnchor.constraint(equalTo: content.topAnchor, constant: padding.top),
                trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -padding.right),
                bottomAnchor.constraint(lessThanOrEqualTo: content.bottomAnchor, constant: padding.bottom)
            ])
            return self
        case .bottomLeadingAlignment:
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: padding.left),
                topAnchor.constraint(greaterThanOrEqualTo: content.topAnchor, constant: -padding.top),
                trailingAnchor.constraint(lessThanOrEqualTo: content.trailingAnchor, constant: padding.right),
                bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -padding.bottom)
            ])
            return self
        case .bottomTrailingAlignment:
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(greaterThanOrEqualTo: content.leadingAnchor, constant: -padding.left),
                topAnchor.constraint(greaterThanOrEqualTo: content.topAnchor, constant: -padding.top),
                trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -padding.right),
                bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -padding.bottom)
            ])
            return self
        case .centerAlignment:
            NSLayoutConstraint.activate([
                centerXAnchor.constraint(equalTo: content.centerXAnchor),
                centerYAnchor.constraint(equalTo: content.centerYAnchor),
                leadingAnchor.constraint(greaterThanOrEqualTo: content.leadingAnchor, constant: padding.left),
                topAnchor.constraint(greaterThanOrEqualTo: content.topAnchor, constant: padding.top),
                trailingAnchor.constraint(lessThanOrEqualTo: content.trailingAnchor, constant: padding.right),
                bottomAnchor.constraint(lessThanOrEqualTo: content.bottomAnchor, constant: padding.bottom)
            ])
            return self
        }
        
    }
    func equalWidth(content:UIView) -> Self{
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: content.widthAnchor)
        ])
        return self
    }
    func equalHeigth(content:UIView) -> Self{
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: content.heightAnchor)
        ])
        return self
    }
}
