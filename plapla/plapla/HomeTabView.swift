//
//  HomeTabView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("ホーム")
                }
            LibraryView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("ライブラリ")
                }
            MyPageView()
                .tabItem {
                    Image(systemName: "person")
                    Text("マイページ")
                }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
