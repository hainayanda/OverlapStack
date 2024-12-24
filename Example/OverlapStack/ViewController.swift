//
//  ViewController.swift
//  OverlapStack
//
//  Created by hainayanda on 12/22/2024.
//  Copyright (c) 2024 hainayanda. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let childViewController = UIHostingController(rootView: CardStackView())
        let childView = childViewController.view!
        self.addChildViewController(childViewController)
        self.view.addSubview(childView)
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: self.view.topAnchor),
            childView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            childView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        childViewController.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
