//
//  OverlapReverseHStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 03/01/25.
//

import SwiftUI

// MARK: OverlapReverseHStackLayout

struct OverlapReverseHStackLayout {
    
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

// MARK: OverlapReverseHStackLayout + OverlapStackLayout
// will put the item backward to negative x, so it will stacked from right to left
// then the position will be adjusted on placing an item
// once the size of the stack is determined and can be used to determine the real x
extension OverlapReverseHStackLayout: OverlapHAxisStackLayout {
    
    @inlinable func widthThatFitsAfter(adding item: OverlapItemCache, previousCalculatedWidth: CGFloat) -> CGFloat {
        max(previousCalculatedWidth, -item.frame.minX)
    }
    
    @inlinable func rectX(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        guard let previousItem else { return -size.width }
        
        let overlapOffset = subview.overlapOffset ?? defaultOverlapOffset
        
        if let itemExpandedOffsetBefore = previousItem.subview.expandedOffset {
            if let leadingExpandedOffset = subview.expandedOffset?.leading {
                return previousItem.frame.minX - max(itemExpandedOffsetBefore.trailing, leadingExpandedOffset) - size.width
            } else {
                return previousItem.frame.minX - itemExpandedOffsetBefore.trailing - size.width
            }
        } else if let leadingExpandedOffset = subview.expandedOffset?.leading {
            return previousItem.frame.maxX - leadingExpandedOffset - size.width
        } else {
            return previousItem.frame.maxX - overlapOffset - size.width
        }
    }
    
    @inlinable func placementItemX(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize) -> CGFloat {
        return bounds.maxX + item.frame.minX
    }
}
