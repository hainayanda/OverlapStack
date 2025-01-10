//
//  OverlapStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import Foundation
import SwiftUI

// MARK: OverlapStackLayout protocol

protocol OverlapStackLayout: Layout where Cache == [OverlapItemCache] {
    func sizeThatFitsAfter(adding item: OverlapItemCache, previousCalculatedSize: CGSize) -> CGSize
    func rect(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGRect
    func finalSizeThatFits(for calculatedSize: CGSize, proposal: ProposedViewSize) -> CGSize
    func placeItem(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize)
}

// MARK: OverlapStackLayout + Layout

extension OverlapStackLayout {
    
    @inlinable func makeCache(subviews: Subviews) -> [OverlapItemCache] { [] }
    
    @inlinable func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout [OverlapItemCache]) -> CGSize {
        var itemBefore: OverlapItemCache?
        var calculatedSize: CGSize = .zero
        cache = subviews.compactMap { subview in
            let size = subview.sizeThatFits(proposal)
            guard size.isRenderable else { return nil }
            let item = OverlapItemCache(
                subview: subview,
                frame: rect(for: subview, sized: size, previousItem: itemBefore)
            )
            itemBefore = item
            calculatedSize = sizeThatFitsAfter(adding: item, previousCalculatedSize: calculatedSize)
            return item
        }
        return finalSizeThatFits(for: calculatedSize, proposal: proposal)
    }
    
    @inlinable func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout [OverlapItemCache]) {
        cache.forEach { item in
            placeItem(item, in: bounds, proposal: proposal)
        }
    }
}
