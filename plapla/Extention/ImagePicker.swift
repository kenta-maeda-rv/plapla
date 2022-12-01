//
//  ImagePicker.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/21.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode

    @Binding var imageselected: UIImage
    @Binding var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        picker.allowsEditing = true
        return picker
    }

    func updateUIViewController(_: UIViewControllerType, context _: UIViewControllerRepresentableContext<ImagePicker>) {}

    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(parent: self)
    }

    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                parent.imageselected = image
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
