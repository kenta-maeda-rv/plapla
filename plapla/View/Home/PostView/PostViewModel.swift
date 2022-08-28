//
//  PostViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/08/28.
//

import SwiftUI

class PostViewModel: ObservableObject {
    
    func tapAddButton(
        contentId: String,
        title: String,
        discription:String,
        image: UIImage,
        process: Process
    ) {
        RepogitoryManager.shared.savePostData(contentId: contentId,
                                              postTitle: title,
                                              postDiscription: discription,
                                              postDate: Date(),
                                              postImage: image,
                                              process: process)
    }
}
