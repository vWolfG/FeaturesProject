//
//  SetupableView.swift
//  FeaturesProject
//
//  Created by Veronika Goreva on 7/27/20.
//  Copyright © 2020 v.wolf.g. All rights reserved.
//

import UIKit

/// Override setup method
class SetupableView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    func setup() {}
}

class SetupableTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setup()
       }

   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       setup()
   }
    
    func setup() {}
    
}
