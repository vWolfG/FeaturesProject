//
//  StrachedView.swift
//  FeaturesProject
//
//  Created by Veronika Goreva on 7/9/20.
//  Copyright © 2020 v.wolf.g. All rights reserved.
//

import UIKit
import Cartography

// Strached view depends on scroll view direction
class StrachedView: UIView {
    
    // MARK: - UIComponents
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var imageView: UIImageView = {
           let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
           return imageView
       }()
    
    // MARK: - Constraints
    
    private var imageHeightConstraint: NSLayoutConstraint?
    private var imageBottomConstraint: NSLayoutConstraint?
    private var containerViewHeightConstraint: NSLayoutConstraint?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.addSubview(containerView)
        containerView.addSubview(imageView)
        constrain(containerView, imageView) { (containerView, imageView) in
            containerView.centerX == containerView.superview!.centerX
            containerViewHeightConstraint = containerView.height == containerView.superview!.height
            containerView.width == containerView.superview!.width
            
            imageView.width == imageView.superview!.width
            imageHeightConstraint = imageView.height == imageView.superview!.height
            imageBottomConstraint = imageView.bottom == imageView.superview!.bottom
        }
        
    }
    
    // MARK: - Open
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        containerViewHeightConstraint?.constant = scrollView.safeAreaInsets.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageBottomConstraint?.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageHeightConstraint?.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }

}
