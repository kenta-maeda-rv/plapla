//
//  MyPageView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct MyPageView: View {
    @StateObject var myPageViewModel: MyPageViewModel = MyPageViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    Text("MyPageView")
                    Text("MyPageView")
                    Text("MyPageView")
                }, header: {
                    Text("MyPageView")
                })
                Section(content: {
                    Text("MyPageView")
                    Text("MyPageView")
                    Text("MyPageView")
                }, header: {
                    Text("MyPageView")
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
