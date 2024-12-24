//
//  OverlapStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import Foundation
import SwiftUI

protocol OverlapStackLayout: Layout where Cache == [OverlapItemCache] {
    var alignment: OverlapStackAlignment { get }
    var direction: OverlapDirection { get }
    func widthAfter(adding item: OverlapItemCache, previousCalculatedSize: CGSize) -> CGFloat
    func heightAfter(adding item: OverlapItemCache, previousCalculatedSize: CGSize) -> CGFloat
    func calculateX(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat
    func calculateY(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat
    func finalSize(for calculatedSize: CGSize, proposal: ProposedViewSize) -> CGSize
    func xPlacement(for item: OverlapItemCache, in bounds: CGRect) -> CGFloat
    func yPlacement(for item: OverlapItemCache, in bounds: CGRect) -> CGFloat
}

extension OverlapStackLayout {
    
    @inlinable func makeCache(subviews: Subviews) -> [OverlapItemCache] { [] }
    
    @inlinable func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout [OverlapItemCache]) -> CGSize {
        var itemBefore: OverlapItemCache?
        var calculatedSize: CGSize = .zero
        cache = subviews.map { subview in
            let size = subview.sizeThatFits(proposal)
            let item = OverlapItemCache(
                subview: subview,
                frame: frame(for: subview, sized: size, previousItem: itemBefore)
            )
            itemBefore = item
            calculatedSize = sizeAfter(adding: item, previousCalculatedSize: calculatedSize)
            return item
        }
        return finalSize(for: calculatedSize, proposal: proposal)
    }
    
    @inlinable func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout [OverlapItemCache]) {
        let items: [OverlapItemCache] = switch direction {
        case .firstOnTop: Array(cache.reversed())
        case .lastOnTop: cache
        }
        items.forEach { item in
            item.subview.place(
                at: CGPoint(
                    x: xPlacement(for: item, in: bounds),
                    y: yPlacement(for: item, in: bounds)
                ),
                proposal: ProposedViewSize(item.frame.size)
            )
        }
    }
    
    @inlinable func sizeAfter(adding item: OverlapItemCache, previousCalculatedSize: CGSize) -> CGSize {
        CGSize(
            width: widthAfter(adding: item, previousCalculatedSize: previousCalculatedSize),
            height: heightAfter(adding: item, previousCalculatedSize: previousCalculatedSize)
        )
    }
    
    @inlinable func coordinate(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGPoint {
        CGPoint(
            x: calculateX(for: subview, sized: size, previousItem: previousItem),
            y: calculateY(for: subview, sized: size, previousItem: previousItem)
        )
    }
    
    @inlinable func frame(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGRect {
        CGRect(
            origin: coordinate(for: subview, sized: size, previousItem: previousItem),
            size: size
        )
    }
}
