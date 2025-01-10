//
//  CardStackView.swift
//  OverlapStack
//
//  Created by Nayanda Haberty on 22/12/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import OverlapStack

struct CardStackView: View {
    
    @State var selectedIndex: Int?
    let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical) {
                OverlapVStack(alignment: .centered, arrangement: .stackedFromTop, defaultOffset: 48) {
                    ForEach(0..<20) { index in
                        CardView(index: index, color: colors[index % colors.count], selected: selectedIndex == index)
                            .expandOverlap(selectedIndex == index, leading: index == 19 ? 48 : 12, trailing: 12)
                            .id(index)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selectedIndex = selectedIndex == index ? nil : index
                                    proxy.scrollTo(index, anchor: .center)
                                }
                            }
                    }
                }
                .padding()
            }
        }
    }
}

struct CardView: View {
    
    let index: Int
    let color: Color
    let selected: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Card \(index)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(maxWidth: 300)
            Spacer().frame(height: 18)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.regular)
                .frame(maxWidth: 300)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(color)
                .shadow(color: .black.opacity(0.2) ,radius: 9)
        }
        
    }
}
