//
//  PracticeDetail.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 19.03.2021.
//

import SwiftUI

struct PracticeDetail: View {
    
    let practice: Practice
    
    let viewModel = PracticeViewModel()
    
    var body: some View {
        Group {
            ScrollView {
                VStack {
                    if let iconUrl = URL.init(string: practice.icon?.url ?? "") {
                        AsyncImage(
                            url: iconUrl,
                            placeholder: {
                                VStack {
                                    LoadingView()
                                        .frame(width: 100, height: 100)
                                }
                            },
                            image: { Image(uiImage: $0).resizable() }
                        )
                        .frame(height: 300)
                        .cornerRadius(5.0)
                    }
                    Text(practice.title ?? "")
                        .font(.headline)
                        .lineLimit(nil)
                    Text(practice.subtitle ?? "")
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }.padding()
                Spacer()
            }
            .padding(.top, 0.3)
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                toolbarGroup
            }
        }.onAppear(perform: {
            if let audioUrl = URL.init(string: practice.audio?.url ?? "") {
                viewModel.prepareAudioSession(audioUrl)
            }
        })
        .onDisappear(perform: {
            viewModel.pause()
        })
    }
    
    var toolbarGroup: some View {
        Group {
            Button(action: {
                viewModel.play()
            }) {
                Image(systemName: "play.fill")
            }
            Spacer()
            Button(action: {
                viewModel.pause()
            }) {
                Image(systemName: "pause.fill")
            }
            Spacer()
            Button(action: {
                viewModel.restart()
            }) {
                Image(systemName: "restart")
            }
        }
    }
}

struct PracticeDetail_Previews: PreviewProvider {
    static var previews: some View {
        PracticeDetail(practice: Practice.uiSample())
    }
}
