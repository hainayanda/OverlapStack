//
//  OverlapVStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

// MARK: OverlapVStackLayout

struct OverlapVStackLayout {
    
    // MARK: Type alias
    
    typealias Cache = [OverlapItemCache]
    
    // MARK: Properties
    
    let alignment: OverlapVStackAlignment
    let defaultOverlapOffset: CGFloat
    
    // MARK: Init
    
    @inlinable init(alignment: OverlapVStackAlignment, defaultOverlapOffset: CGFloat) {
        self.alignment = alignment
        self.defaultOverlapOffset = defaultOverlapOffset
    }
}

// MARK: OverlapVStackLayout + OverlapStackLayout

extension OverlapVStackLayout: OverlapVAxisStackLayout {
    
    @inlinable func heightThatFitsAfter(adding item: OverlapItemCache, previousCalculatedHeight: CGFloat) -> CGFloat {
        max(previousCalculatedHeight, item.frame.maxY)
    }
    
    @inlinable func rectY(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        guard let previousItem else { return .zero }
        
        let overlapOffset = subview.overlapOffset ?? defaultOverlapOffset
        
        if let itemExpandedOffsetBefore = previousItem.subview.expandedOffset {
            if let leadingExpandedOffset = subview.expandedOffset?.leading {
                return previousItem.frame.maxY + max(itemExpandedOffsetBefore.trailing, leadingExpandedOffset)
            } else {
                return previousItem.frame.maxY + itemExpandedOffsetBefore.trailing
            }
        } else if let leadingExpandedOffset = subview.expandedOffset?.leading {
            return previousItem.frame.minY + leadingExpandedOffset
        } else {
            return previousItem.frame.minY + overlapOffset
        }
    }
    
    @inlinable func placementItemY(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize) -> CGFloat {
        bounds.minY + item.frame.minY
    }
}
