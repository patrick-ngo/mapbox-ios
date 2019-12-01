//
//  ViewController.swift
//  mapbox-ios
//
//  Created by Patrick Ngo on 2019-11-30.
//  Copyright © 2019 Patrick Ngo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var mapView: MapView = {
        let mv = MapView()
        return mv
    }()
    
    let bottomView: BottomView = {
        let view = BottomView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(bottomView)
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaInsets.top)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
}

