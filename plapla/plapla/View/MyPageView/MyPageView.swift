//
//  MyPageView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel = MyPageViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    Text("共有設定")
                }, header: {
                    Text("各種設定")
                })
                
                Section(content: {
                    Text("問い合わせ")
                    Text("レビュー")
                    Text("ライセンス")
                    Text("利用規約・プライバシーポリシー")
                    Text("バージョン")
                }, header: {
                    Text("")
                })
            }
            .navigationTitle(Text("MyPageView"))
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
