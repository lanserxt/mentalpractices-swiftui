//
//  LoaderView.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 18.03.2021.
//

import SwiftUI

struct LoadingView: View {
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 3.0)
            .repeatForever(autoreverses: false)
    }
    @State var isActive = false
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 3.0)
                    .opacity(0.3)
                    .foregroundColor(Color.blue)
                
                Circle()
                    .trim(from: 0.0, to: 0.3)
                    .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees: isActive ? 360.0 : 0.0))
                    .animation(self.foreverAnimation)
            }
            }.padding()
            .background(Color.white)
            .cornerRadius(10.0)
            .onAppear {
                self.isActive = true
        }
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
       LoadingView()
    }
}
