//
//  Untitled.swift
//  Pods
//
//  Created by Nayanda Haberty on 03/01/25.
//

import SwiftUI

protocol OverlapVAxisStackLayout: OverlapSplitAxisStackLayout  {
    var alignment: OverlapVStackAlignment { get }
}

extension OverlapVAxisStackLayout {
    
    @inlinable func finalSizeThatFits(for calculatedSize: CGSize, proposal: ProposedViewSize) -> CGSize {
        CGSize(
            width: max(proposal.width.positiveNormalizedValue, calculatedSize.width),
            height: calculatedSize.height
        )
    }
    
    @inlinable func widthThatFitsAfter(adding item: OverlapItemCache, previousCalculatedWidth: CGFloat) -> CGFloat {
        return switch alignment {
        case .centered: max(previousCalculatedWidth, item.frame.axisRotationalSize.width)
        case .top: max(previousCalculatedWidth, item.frame.maxX)
        case .bottom: max(previousCalculatedWidth, abs(item.frame.minX))
        }
    }
    
    @inlinable func rectX(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        return switch alignment {
        case .centered: subview.alignmentOffset - (size.width / 2)
        case .top: subview.alignmentOffset
        case .bottom: subview.alignmentOffset - size.width
        }
    }
    
    @inlinable func placementItemX(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize) -> CGFloat {
        return switch alignment {
        case .top: bounds.minX + item.frame.minX
        case .centered: bounds.minX + ((bounds.size.width - item.frame.size.width) / 2) + item.frame.midX
        case .bottom: bounds.minX + bounds.size.width + item.frame.minX
        }
    }
}
