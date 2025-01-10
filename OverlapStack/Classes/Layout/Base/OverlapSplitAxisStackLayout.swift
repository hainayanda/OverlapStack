//
//  OverlapSplitAxisStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 03/01/25.
//

import SwiftUI

protocol OverlapSplitAxisStackLayout: OverlapStackLayout {
    func heightThatFitsAfter(adding item: OverlapItemCache, previousCalculatedHeight: CGFloat) -> CGFloat
    func widthThatFitsAfter(adding item: OverlapItemCache, previousCalculatedWidth: CGFloat) -> CGFloat
    func rectX(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat
    func rectY(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat
    func placementItemX(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize) -> CGFloat
    func placementItemY(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize) -> CGFloat
}

extension OverlapSplitAxisStackLayout {
    @inlinable func sizeThatFitsAfter(adding item: OverlapItemCache, previousCalculatedSize: CGSize) -> CGSize {
        let height = heightThatFitsAfter(adding: item, previousCalculatedHeight: previousCalculatedSize.height)
        let width = widthThatFitsAfter(adding: item, previousCalculatedWidth: previousCalculatedSize.width)
        return CGSize(width: width, height: height)
    }
    
    @inlinable func rect(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGRect {
        let origin = CGPoint(
            x: rectX(for: subview, sized: size, previousItem: previousItem),
            y: rectY(for: subview, sized: size, previousItem: previousItem)
        )
        return CGRect(origin: origin, size: size)
    }
    
    @inlinable func placeItem(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize)  {
        let placement = CGPoint(
            x: placementItemX(item, in: bounds, proposal: proposal),
            y: placementItemY(item, in: bounds, proposal: proposal)
        )
        item.subview.place(
            at: placement,
            proposal: ProposedViewSize(item.frame.size)
        )
    }
}
