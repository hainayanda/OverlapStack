//
//  OverlapHAxisStackLayout.swift
//  Pods
//
//  Created by Nayanda Haberty on 03/01/25.
//

import SwiftUI

protocol OverlapHAxisStackLayout: OverlapSplitAxisStackLayout {
    var alignment: OverlapHStackAlignment { get }
}

extension OverlapHAxisStackLayout {
    
    @inlinable func finalSizeThatFits(for calculatedSize: CGSize, proposal: ProposedViewSize) -> CGSize {
        CGSize(
            width: calculatedSize.width,
            height: max(proposal.height.positiveNormalizedValue, calculatedSize.height)
        )
    }
    
    @inlinable func heightThatFitsAfter(adding item: OverlapItemCache, previousCalculatedHeight: CGFloat) -> CGFloat {
        switch alignment {
        case .centered: max(previousCalculatedHeight, item.frame.axisRotationalSize.height)
        case .top: max(previousCalculatedHeight, item.frame.maxY)
        case .bottom: max(previousCalculatedHeight, abs(item.frame.minY))
        }
    }
    
    @inlinable func rectY(for subview: LayoutSubview, sized size: CGSize, previousItem: OverlapItemCache?) -> CGFloat {
        return switch alignment {
        case .centered: subview.alignmentOffset - (size.height / 2)
        case .top: subview.alignmentOffset
        case .bottom: subview.alignmentOffset - size.height
        }
    }
    
    @inlinable func placementItemY(_ item: OverlapItemCache, in bounds: CGRect, proposal: ProposedViewSize) -> CGFloat {
        return switch alignment {
        case .top: bounds.minY + item.frame.minY
        case .centered: bounds.minY + ((bounds.size.height - item.frame.size.height) / 2) + item.frame.midY
        case .bottom: bounds.minY + bounds.size.height + item.frame.minY
        }
    }
}
