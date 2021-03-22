//
//  AVPlayer+Tools.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 22.03.2021.
//

import AVKit
import AVFoundation

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}
