//
//  UVIndexCircularProgressView.swift
//  Tempus
//
//  Created by Jorge Sirias on 1/31/26.
//

import SwiftUI

struct UVIndexCircularProgressView: View {
    @State private var progress: CGFloat = 0.34
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.red.opacity(0.5), lineWidth: 20)
                .frame(width: 200, height: 200)
            
            Circle()
                .trim(from: 0, to: progress) // 1
                .stroke(Color.red, style: StrokeStyle(
                    lineWidth: 20,
                    lineCap: .round
                ))
                .rotationEffect(.degrees(-90))
                .frame(width: 200, height: 200)
                .animation(.linear(duration: 2.0), value: progress)
            Text("\(progress * 100, specifier: "%.0f")")
                                .font(.largeTitle)
                                .bold()
        }
    }
}

#Preview {
    UVIndexCircularProgressView()
}
