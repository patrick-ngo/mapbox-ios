//
//  BottomView.swift
//  mapbox-ios
//
//  Created by Patrick Ngo on 2019-12-01.
//  Copyright © 2019 Patrick Ngo. All rights reserved.
//

import UIKit
import SnapKit

class BottomView: UIView {

    //MARK: - Views -
    
    lazy var pickupCell: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    var pickupTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Pickup"
        return lbl
    }()
    
    var pickupTextField: UITextField = {
        let tf = UITextField()
        tf.text = "-"
        return tf
    }()
    
    lazy var dropoffCell: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    var dropoffTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Dropoff"
        return lbl
    }()
    
    lazy var dropoffTextField: UITextField = {
        let tf = UITextField()
        tf.text = "-"
        return tf
    }()
    
    //MARK: - Init -
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        // Stack View
        
        let stackView = UIStackView(arrangedSubviews: [pickupCell, dropoffCell])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        // View Hierarchy
        
        self.addSubview(stackView)
        self.pickupCell.addSubview(self.pickupTitleLabel)
        self.pickupCell.addSubview(self.pickupTextField)
        self.dropoffCell.addSubview(self.dropoffTitleLabel)
        self.dropoffCell.addSubview(self.dropoffTextField)

        // Constraints

        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        // Pickup
        self.pickupTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.height.equalTo(20)
            make.right.equalTo(0)
            make.left.equalTo(0)
            make.bottom.equalTo(self.pickupTextField.snp.top)
        }
        
        self.pickupTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pickupTitleLabel.snp.bottom)
            make.height.equalTo(20)
            make.right.equalTo(0)
            make.left.equalTo(0)
        }
        
        // Dropoff
        self.dropoffTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.height.equalTo(20)
            make.right.equalTo(0)
            make.left.equalTo(0)
            make.bottom.equalTo(self.dropoffTextField.snp.top)
        }
        
        self.dropoffTextField.snp.makeConstraints { (make) in
            make.top.equalTo(dropoffTitleLabel.snp.bottom)
            make.height.equalTo(20)
            make.right.equalTo(0)
            make.left.equalTo(0)
        }
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
}
