//
//  FlippableUIButton.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-08.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import UIKit

@IBDesignable
class FlippableUIButton: UIButton
{
    var _flipImageForRTL: Bool = false
    
    @IBInspectable
    var flipImageForRightToLeftLanguages: Bool
    {
        get { return _flipImageForRTL }
        
        set { _flipImageForRTL = newValue }
    }
    
    override func awakeFromNib() {
        if (Locale.current.isRightToLeft)
        {
            flipAllEdgeInsets()
            
            if (flipImageForRightToLeftLanguages)
            {
                flipImage()
            }
        }
    }
    
    fileprivate func flipAllEdgeInsets() -> Void
    {
        flip(edgeInsets: &contentEdgeInsets)
        
        flip(edgeInsets: &titleEdgeInsets)
        
        flip(edgeInsets: &imageEdgeInsets)
    }
    
    fileprivate func flipImage() -> Void
    {
        if let image = imageView?.image
        {
            let flippedImage = UIImage(
                cgImage: image.cgImage!,
                scale: image.scale,
                orientation: .upMirrored)
            
            setImage(flippedImage, for: .normal)
        }
    }
    
    fileprivate func flip(edgeInsets: inout UIEdgeInsets) -> Void
    {
        let leftEdgeInset = edgeInsets.left
        
        edgeInsets.left = edgeInsets.right
        edgeInsets.right = leftEdgeInset
    }
}
