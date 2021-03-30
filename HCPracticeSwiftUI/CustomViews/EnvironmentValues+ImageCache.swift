//
//  EnvironmentValues+ImageCache.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 18.03.2021.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
