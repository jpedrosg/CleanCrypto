//
//  UIImage.swift
//  CleanCryptoSnapshotsTests
//
//  Created by João Pedro Giarrante on 04/10/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import UIKit

extension UIImage {
    
    func removeStatusBar() -> UIImage? {
        var frames: [CGRect] = []
        let rectangle: CGRect
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let statusBarFrame = window?.windowScene?.statusBarManager?.statusBarFrame
            rectangle = CGRect(x: 0, y: 0, width: statusBarFrame?.width ?? 0, height: statusBarFrame?.height ?? 0)
        } else {
            rectangle = CGRect(x: 0, y: 0, width: UIApplication.shared.statusBarFrame.width, height: UIApplication.shared.statusBarFrame.height)
        }
        frames.append(rectangle)
        return addImageWithFrame(frames: frames)
    }
    
    func addImageWithFrame(frames: [CGRect]) -> UIImage? {
        let imageSize = size
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(imageSize, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        draw(at: .zero)
        context.setFillColor(UIColor.black.cgColor)
        context.addRects(frames)
        context.drawPath(using: .fill)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
