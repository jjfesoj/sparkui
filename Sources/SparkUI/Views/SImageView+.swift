//
//  SImageView+.swift
//  
//
//  Created by Alex Nagy on 05/03/2020.
//

import UIKit
import SDWebImage

extension SImageView {
    
    @discardableResult
    public func background(color: UIColor) -> SImageView {
        self.object.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func circular(radius: CGFloat) -> SImageView {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        setSize(CGSize(width: radius * 2, height: radius * 2))
        return self
    }
    
    @discardableResult
    open func size(_ size: CGSize) -> SImageView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }
    
    @discardableResult
    open func height(_ height: CGFloat) -> SImageView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    open func width(_ width: CGFloat) -> SImageView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    open func setImage(from imageUrl: String, renderingMode: UIImage.RenderingMode = .alwaysOriginal, contentMode: UIView.ContentMode = .scaleAspectFill, placeholderImage: UIImage? = nil) {
        self.object.contentMode = contentMode
        if imageUrl.contains("https:") {
            self.object.sd_setImage(with: URL(string: imageUrl), placeholderImage: placeholderImage) { (image, err, cacheType, url) in
                guard let url = url else {
                    print("SDWebImage error: Invalid url provided: \(imageUrl)")
                    return
                }
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                guard image != nil else {
                    print("SDWebImage error: Could not load image; it is nil")
                    return
                }
                print("Successfully loaded image from Url: \(url.absoluteString) with Cache Type: \(cacheType)")
            }
        } else {
            if UIImage(named: imageUrl) != nil {
                self.object.image = UIImage(named: imageUrl)?.withRenderingMode(renderingMode)
            } else if let placeholderImage = placeholderImage {
                self.object.image = placeholderImage.withRenderingMode(renderingMode)
            }
        }
    }
    
    @discardableResult
    open func setImage(_ named: String, renderingMode: UIImage.RenderingMode = .alwaysOriginal, contentMode: UIView.ContentMode = .scaleAspectFill, placeholderImage: UIImage? = nil) -> SImageView {
        self.object.contentMode = contentMode
        if UIImage(named: named) != nil {
            self.object.image = UIImage(named: named)?.withRenderingMode(renderingMode)
        } else if let placeholderImage = placeholderImage {
            self.object.image = placeholderImage.withRenderingMode(renderingMode)
        }
        return self
    }
    
    @discardableResult
    open func setSystemImage(_ systemName: String, renderingMode: UIImage.RenderingMode = .alwaysTemplate, contentMode: UIView.ContentMode = .scaleAspectFit, placeholderImage: UIImage? = nil) -> SImageView {
        self.object.contentMode = contentMode
        if UIImage(systemName: systemName) != nil {
            self.object.image = UIImage(systemName: systemName)?.withRenderingMode(renderingMode)
        } else if let placeholderImage = placeholderImage {
            self.object.image = placeholderImage.withRenderingMode(renderingMode)
        }
        return self
    }
    
    @discardableResult
    open func templateImageColor(_ color: UIColor) -> SImageView {
        self.object.tintColor = color
        return self
    }
    
    @discardableResult
    open func isHidden(_ isHidden: Bool = true) -> SImageView {
        self.object.isHidden = isHidden
        return self
    }
    
    @discardableResult
    open func contentMode(_ contentMode: ContentMode) -> SImageView {
        self.object.contentMode = contentMode
        return self
    }
    
    @discardableResult
    open func masksToBounds(_ value: Bool = true) -> SImageView {
        object.layer.masksToBounds = value
        return self
    }
    
    @discardableResult
    open func cornerRadius(_ radius: CGFloat) -> SImageView {
        object.layer.cornerRadius = radius
        object.layer.masksToBounds = true
        return self
    }
}


