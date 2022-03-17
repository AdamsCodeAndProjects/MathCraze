//
//  playViewController.swift
//  MathArena
//
//  Created by adam janusewski on 6/23/21.
//

import UIKit

class playViewController: UIViewController {

    @IBAction func playNowButton(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var mathImage: UIImageView!
    @IBOutlet weak var warsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mathImage.center = CGPoint(x: mathImage.center.x - 500, y: mathImage.center.y)
        UIView.animate(withDuration: 2) {
            self.mathImage.center = CGPoint(x: self.mathImage.center.x + 500, y: self.mathImage.center.y)
        }
        
        warsImage.center = CGPoint(x: warsImage.center.x + 500, y: warsImage.center.y)
        UIView.animate(withDuration: 2) {
            self.warsImage.center = CGPoint(x: self.warsImage.center.x - 500, y: self.warsImage.center.y)
        }
    }
}
