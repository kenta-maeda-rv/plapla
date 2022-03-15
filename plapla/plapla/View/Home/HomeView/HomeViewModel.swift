//
//  HomeViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var contents: [Content] = [
    
        Content(contentTitle: Process.temporaryAssembly, contentDrscription: "とりあえず", lastEditDate: Date(),postData: []),
        Content(contentTitle: Process.painting, contentDrscription: "下地サフ", lastEditDate: Date(),postData: []),
        Content(contentTitle: Process.assembly, contentDrscription: "完成", lastEditDate: Date(),postData: [])
    
    ]
}
