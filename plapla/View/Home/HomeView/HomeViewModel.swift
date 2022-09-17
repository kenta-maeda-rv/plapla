//
//  HomeViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI
import RealmSwift

class HomeViewModel: ObservableObject {
    func getScreenData(contentId: String) -> [PostData] {
        var result:[PostData] = []
        
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
        print("取得したコンテンツデータ\(data)")
        result.append(contentsOf: data)
        print("取得したコンテンツデータ\(result)")
        return result
    }
    
    func getContentTitle(id: String) -> String{
        guard let contentTitle = RepogitoryManager.shared.contentPermanentlyDb?.filter("contentId == %@", id).first?.contentTitle else {
            print("コンテンツタイトルの取得失敗")
            return ""
        }
        return contentTitle
    }
}
