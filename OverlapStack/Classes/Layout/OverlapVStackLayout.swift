//
//  OverlapVStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

struct OverlapVStackLayout: OverlapStackLayout {
    
    typealias Cache = [OverlapItemCache]
    
    let alignment: OverlapStackAlignment
    let direction: OverlapDirection
    let defaultOverlapOffset: CGFloat
    
    @inlinable init(alignment: OverlapStackAlignment, direction: OverlapDirection, defaultOverlapOffset: CGFloat) {
        self.alignment = alignment
        self.direction = direction
        self.defaultOverlapOffset = defaultOverlapOffset
    }
    
    @inlinable func widthAfter(adding item: OverlapItemCache, previousCalculatedSize: CGSize) -> CGFloat {
        return switch alignment {
        case .centered: max(previousCalculatedSize.width, item.frame.circlingAxisSize.width)
        case .leading: max(previousCalculatedSize.width, item.frame.maxX)
        case .trailing: max(previousCalculatedSize.width, abs(item.frame.minX))
        }
    }
    
    @inlinable func heightAfter(adding item: OverlapItemCache, previousCalculatedSize: CGSize) -> CGFloat {
        max(previousCalculatedSize.height, item.frame.maxY)
    }
    
    @inlinable func calculateX(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        return switch alignment {
        case .centered: subview.alignmentOffset - (size.width / 2)
        case .leading: subview.alignmentOffset
        case .trailing: subview.alignmentOffset - size.width
        }
    }
    
    @inlinable func calculateY(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        guard let previousItem else { return .zero }
        
        let overlapOffset = subview.overlapOffset ?? defaultOverlapOffset
        
        if let itemExpandedOffsetBefore = previousItem.subview.expandedOffset {
            let axis = previousItem.frame.maxY
            if let leadingExpandedOffset = subview.expandedOffset?.leading {
                return axis + max(itemExpandedOffsetBefore.trailing, leadingExpandedOffset)
            } else {
                return axis + itemExpandedOffsetBefore.trailing
            }
        } else if let leadingExpandedOffset = subview.expandedOffset?.leading {
            return previousItem.frame.minY + leadingExpandedOffset
        } else {
            return previousItem.frame.minY + overlapOffset
        }
    }
    
    @inlinable func finalSize(for calculatedSize: CGSize, proposal: ProposedViewSize) -> CGSize {
        return CGSize(
            width: max(proposal.width.normalValue, calculatedSize.width),
            height: calculatedSize.height
        )
    }
    
    @inlinable func xPlacement(for item: OverlapItemCache, in bounds: CGRect) -> CGFloat {
        return switch alignment {
        case .leading: bounds.minX + item.frame.minX
        case .centered: bounds.minX + ((bounds.size.width - item.frame.size.width) / 2) + item.frame.midX
        case .trailing: bounds.minX + bounds.size.width + item.frame.minX
        }
    }
    
    @inlinable func yPlacement(for item: OverlapItemCache, in bounds: CGRect) -> CGFloat {
        return bounds.minY + item.frame.minY
    }
}
