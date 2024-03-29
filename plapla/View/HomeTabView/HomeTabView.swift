//
//  HomeTabView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct HomeTabView: View {
    // 初回起動(true:初回起動 ,false:2回目以降)
    @AppStorage("isFirstLaunch") var isFirstLaunch = true

    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("ライブラリ")
                }
            PaintManagementView()
                .tabItem {
                    Image(systemName: "paintbrush.pointed")
                    Text("塗料")
                }
            MyPageView()
                .tabItem {
                    Image(systemName: "person")
                    Text("マイページ")
                }
        }
        .fullScreenCover(isPresented: $isFirstLaunch) {
            OnBoargingView()
        }
        .background(
            Color.accentColor
        )
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
