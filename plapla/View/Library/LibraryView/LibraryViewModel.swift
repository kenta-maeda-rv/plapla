//
//  LibraryViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/16.
//

import SwiftUI

class LibraryViewModel: ObservableObject {
    
    @Published var columns: [GridItem] = [GridItem(),GridItem()]
    
    @Published var contents: [Content] = []
    
    init() {
        self.initScreenData()
    }
    
    func initScreenData() {
        guard let contentDatas = RepogitoryManager.shared.contentPermanentlyDb else {
            logger.debug("DB取得に失敗")
            return
        }
        
        let data = contentDatas.map{Content(contentId: $0.contentId,
                                            contentTitle: $0.contentTitle,
                                            contentDiscription: $0.contentDiscription,
                                            contentImageUrl: $0.contentImageUrl,
                                            lastEditDate: $0.lastEditDate)}
        print("取得したコンテンツデータ\(data)")
        self.contents.append(contentsOf: data)
    }
}
