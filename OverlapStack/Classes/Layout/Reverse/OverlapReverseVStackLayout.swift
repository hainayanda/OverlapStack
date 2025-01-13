//
//  OverlapReverseVStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 03/01/25.
//

import SwiftUI

// MARK: OverlapReverseVStackLayout

struct OverlapReverseVStackLayout {
    
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

// MARK: OverlapReverseVStackLayout + OverlapStackLayout
// will put the item backward to negative y, so it will stacked from bottom to top
// then the position will be adjusted on placing an item
// once the size of the stack is determined and can be used to determine the real y
extension OverlapReverseVStackLayout: OverlapVAxisStackLayout {
    
    @inlinable func heightThatFitsAfter(adding item: OverlapItemCache, previousCalculatedHeight: CGFloat) -> CGFloat {
        max(previousCalculatedHeight, -item.frame.minY)
    }
    
    @inlinable func rectY(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        guard let previousItem else { return -size.height }
        
        let overlapOffset = subview.overlapOffset ?? defaultOverlapOffset
        
        if let itemExpandedOffsetBefore = previousItem.subview.expandedOffset {
            if let leadingExpandedOffset = subview.expandedOffset?.leading {
                return previousItem.frame.minY - max(itemExpandedOffsetBefore.trailing, leadingExpandedOffset) - size.height
            } else {
                return previousItem.frame.minY - itemExpandedOffsetBefore.trailing - size.height
            }
        } else if let leadingExpandedOffset = subview.expandedOffset?.leading {
            return previousItem.frame.maxY - leadingExpandedOffset - size.height
        } else {
            return previousItem.frame.maxY - overlapOffset - size.height
        }
    }
    
    @inlinable func placementItemY(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize) -> CGFloat {
        return bounds.maxY + item.frame.minY
    }
}
