//
//  HomeViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI
import RealmSwift

class HomeViewModel: ObservableObject {
    
    @Published var contents: [Content] = [
    
//        Content(contentTitle: Process.temporaryAssembly.processString, contentDrscription: "とりあえず", lastEditDate: Date(),postData: []),
//        Content(contentTitle: Process.painting.processString, contentDrscription: "下地サフ", lastEditDate: Date(),postData: []),
//        Content(contentTitle: Process.assembly.processString, contentDrscription: "完成", lastEditDate: Date(),postData: [])
//    
    ]
    init() {
        self.initScreenData()
    }
    
    func initScreenData() {
        guard let contentDatas = RepogitoryManager.shared.contentPermanentlyDb else {
            print("DB取得に失敗")
            return
        }
        let data = contentDatas.map{Content(contentTitle: $0.contentTitle,
                                            contentDiscription: $0.contentDiscription,
                                            contentImageUrl: $0.contentImageUrl,
                                            lastEditDate: $0.lastEditDate)}
        self.contents.append(contentsOf: data)
    }
}
