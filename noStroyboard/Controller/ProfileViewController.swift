//
//  ViewController.swift
//  noStroyboard
//
//  Created by İSMAİL AÇIKYÜREK on 17.05.2022.
//

import UIKit

class ViewController: UIViewController {
    var profile : profileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profile = profileView(frame: CGRect.zero)
        self.view.addSubview(profile)
        
        //autoLayout
        profile.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
}

