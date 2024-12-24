//
//  OverlapHStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

struct OverlapHStackLayout: OverlapStackLayout {
    
    typealias Cache = [OverlapItemCache]
    
    let alignment: OverlapStackAlignment
    let direction: OverlapDirection
    let defaultOverlapOffset: CGFloat
    
    @inlinable init(alignment: OverlapStackAlignment, direction: OverlapDirection, defaultOverlapOffset: CGFloat) {
        self.alignment = alignment
        self.direction = direction
        self.defaultOverlapOffset = defaultOverlapOffset
    }
    
    @inlinable func heightAfter(adding item: OverlapItemCache, previousCalculatedSize: CGSize) -> CGFloat {
        return switch alignment {
        case .centered: max(previousCalculatedSize.height, item.frame.circlingAxisSize.height)
        case .leading: max(previousCalculatedSize.height, item.frame.maxY)
        case .trailing: max(previousCalculatedSize.height, abs(item.frame.minY))
        }
    }
    
    @inlinable func widthAfter(adding item: OverlapItemCache, previousCalculatedSize: CGSize) -> CGFloat {
        max(previousCalculatedSize.width, item.frame.maxX)
    }
    
    @inlinable func calculateY(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        return switch alignment {
        case .centered: subview.alignmentOffset - (size.height / 2)
        case .leading: subview.alignmentOffset
        case .trailing: subview.alignmentOffset - size.height
        }
    }
    
    @inlinable func calculateX(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        guard let previousItem else { return .zero }
        
        let overlapOffset = subview.overlapOffset ?? defaultOverlapOffset
        
        if let itemExpandedOffsetBefore = previousItem.subview.expandedOffset {
            let axis = previousItem.frame.maxX
            if let leadingExpandedOffset = subview.expandedOffset?.leading {
                return axis + max(itemExpandedOffsetBefore.trailing, leadingExpandedOffset)
            } else {
                return axis + itemExpandedOffsetBefore.trailing
            }
        } else if let leadingExpandedOffset = subview.expandedOffset?.leading {
            return previousItem.frame.minX + leadingExpandedOffset
        } else {
            return previousItem.frame.minX + overlapOffset
        }
    }
    
    @inlinable func finalSize(for calculatedSize: CGSize, proposal: ProposedViewSize) -> CGSize {
        return CGSize(
            width: calculatedSize.width,
            height: max(proposal.height.normalValue, calculatedSize.height)
        )
    }
    
    @inlinable func yPlacement(for item: OverlapItemCache, in bounds: CGRect) -> CGFloat {
        return switch alignment {
        case .leading: bounds.minY + item.frame.minY
        case .centered: bounds.minY + ((bounds.size.height - item.frame.size.height) / 2) + item.frame.midY
        case .trailing: bounds.minY + bounds.size.height + item.frame.minY
        }
    }
    
    @inlinable func xPlacement(for item: OverlapItemCache, in bounds: CGRect) -> CGFloat {
        return bounds.minX + item.frame.minX
    }
}
