//
//  plaplaApp.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/09.
//

import SwiftUI

@main
struct plaplaApp: App {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            HomeTabView()
        }
        .onChange(of: scenePhase) { scene in
            switch scene {
            case .active:
                logger.debug("scenePhase: active")
            case .inactive:
                logger.debug("scenePhase: inactive")
            case .background:
                logger.debug("scenePhase: background")
            @unknown default: break
            }
        }
    }
}
