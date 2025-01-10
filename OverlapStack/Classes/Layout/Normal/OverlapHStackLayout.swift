//
//  OverlapHStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

// MARK: OverlapHStackLayout

struct OverlapHStackLayout {
    
    // MARK: Type alias
    
    typealias Cache = [OverlapItemCache]
    
    // MARK: Properties
    
    let alignment: OverlapHStackAlignment
    let defaultOverlapOffset: CGFloat
    
    // MARK: Init
    
    @inlinable init(alignment: OverlapHStackAlignment, defaultOverlapOffset: CGFloat) {
        self.alignment = alignment
        self.defaultOverlapOffset = defaultOverlapOffset
    }
}

// MARK: OverlapHStackLayout + OverlapStackLayout

extension OverlapHStackLayout: OverlapHAxisStackLayout {
    
    @inlinable func widthThatFitsAfter(adding item: OverlapItemCache, previousCalculatedWidth: CGFloat) -> CGFloat {
        max(previousCalculatedWidth, item.frame.maxX)
    }
    
    @inlinable func rectX(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        guard let previousItem else { return .zero }
        
        let overlapOffset = subview.overlapOffset ?? defaultOverlapOffset
        
        if let itemExpandedOffsetBefore = previousItem.subview.expandedOffset {
            if let leadingExpandedOffset = subview.expandedOffset?.leading {
                return previousItem.frame.maxX + max(itemExpandedOffsetBefore.trailing, leadingExpandedOffset)
            } else {
                return previousItem.frame.maxX + itemExpandedOffsetBefore.trailing
            }
        } else if let leadingExpandedOffset = subview.expandedOffset?.leading {
            return previousItem.frame.minX + leadingExpandedOffset
        } else {
            return previousItem.frame.minX + overlapOffset
        }
    }
    
    @inlinable func placementItemX(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize) -> CGFloat {
        bounds.minX + item.frame.minX
    }
}
