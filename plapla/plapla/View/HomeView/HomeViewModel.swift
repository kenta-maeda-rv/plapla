//
//  HomeViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var contents: [Content] = [
    
        Content(contentTitle: "仮組み", contentDrscription: "とりあえず", contentDate: Date()),
        Content(contentTitle: "塗装", contentDrscription: "下地サフ", contentDate: Date()),
        Content(contentTitle: "本組み", contentDrscription: "完成", contentDate: Date())
    
    ]
}
