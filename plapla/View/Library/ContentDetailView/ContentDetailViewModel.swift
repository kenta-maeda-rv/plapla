//
//  ContentDetailViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/14.
//

import SwiftUI

class ContentDetailViewModel: ObservableObject {
    
    func getScreenData(contentId: String) -> [PostData] {
        var result:[PostData] = []
        print("検索するcontentId:\(contentId)")
        guard let postData = RepogitoryManager.shared.postDataPermanentlyDb?.filter("contentId == %@", contentId) else {
            print("投稿データの取得失敗")
            return result
        }
        
        let data = postData.map{PostData(postId: $0.postId,
                                         contentId: $0.contentId!,
                                         postTitle: $0.postTitle!,
                                         postDiscription: $0.postDiscription!,
                                         postDate: $0.postDate!,
                                         ImageUrl: $0.ImageUrl!,
                                         process: $0.process!)}
        result.append(contentsOf: data)
        print("取得したコンテンツデータ\(result)")
        return result
    }
}
