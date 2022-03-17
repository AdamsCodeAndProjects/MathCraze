//
//  gameOverViewController.swift
//  MathArena
//
//  Created by adam janusewski on 6/23/21.
//

import UIKit

class gameOverViewController: UIViewController {
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    var vc1 = mathArenasViewController()
    var completionHandler: ((String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        completionHandler?(finalScoreLabel.text)

        // Do any additional setup after loading the view.
//        finalScoreLabel.text =
//        finalScoreLabel.text = mathArenasViewController().pointsScored.text
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
//           completionHandler?(finalScoreLabel.text)
       }
}
