//
//  PracticeRow.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//

import SwiftUI

struct PracticeRow: View {
    
    private let practice: Practice
    
    init(practice: Practice) {
        self.practice = practice
    }
    
    var body: some View {
        HStack(alignment: .top) {
            if let iconUrl = URL.init(string: practice.icon?.url ?? "") {
                AsyncImage(
                    url: iconUrl,
                    placeholder: {
                        LoadingView()
                        .frame(width: 80, height: 80)
                    },
                    image: { Image(uiImage: $0).resizable() }
                )
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text(practice.title ?? "")
                    .font(.headline)
                Text(practice.subtitle ?? "")
                    .font(.subheadline)
                    .padding(.top, 2)
            }.padding(.all, 4)
        }
    }
}
