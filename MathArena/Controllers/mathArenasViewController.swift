
import UIKit

class mathArenasViewController: UIViewController {
    

    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var pointsScored: UILabel!
    @IBOutlet weak var timeLeft: UILabel!

    @IBOutlet weak var buttonAOutlet: UIButton!
    @IBOutlet weak var buttonBOutlet: UIButton!
    @IBOutlet weak var buttonCOutlet: UIButton!
    @IBOutlet weak var buttonDOutlet: UIButton!
    
    var completionHandler: ((String?) -> Void)?
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = Int(sender.currentTitle!)
    
        if userAnswer! == randomNumberOne + randomNumberTwo {
            points += 10
            secondsRemaining += 2
            newEquation()
        } else {
            points -= 5
            newEquation()
        }
    }
    
    //  Funtion for Answers
    func randomizingMultChoice() {
        let p1 = answer()
        var p2 = Int.random(in: 0...40)
        if p2 == p1 {
            p2 = p1+1
        }
        
        var p3 = Int.random(in: 0...40)
        if p3 == p1 {
            p3 = p1+2
        } else if p3 == p2 {
            p3=p2+1
        }

        var p4 = Int.random(in: 0...40)
        if p4 == p1 {
            p4 = abs(p1-1)
        } else if p4 == p3 {
            p4 = abs(p3-1)
        } else if p4 == p2 {
            p4 = abs(p2-1)
        }
        let choices:Array=[p1, p2, p3, p4]
        let uniqueArray = Array(Set(choices))
        print(uniqueArray)
        
        // Calling random element from the array
        buttonAOutlet.setTitle(String(uniqueArray[0]), for: .normal)
        buttonBOutlet.setTitle(String(uniqueArray[1]), for: .normal)
        buttonCOutlet.setTitle(String(uniqueArray[2]), for: .normal)
        buttonDOutlet.setTitle(String(uniqueArray[3]), for: .normal)
    }
    
    var points = 0
    var secondsRemaining = 10
    var correctAnswer = false
    var randomNumberOne = Int.random(in: 0...20)
    var randomNumberTwo = Int.random(in: 0...20)
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomizingMultChoice()
        number1.text = String(randomNumberOne)
        number2.text = String(randomNumberTwo)
        timeLeft.text = "10"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timing), userInfo: nil, repeats: true)
        
        updateUI()
    }
    
    //  Manages the time
    @objc func timing() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            updateUI()
        } else if secondsRemaining == 0 {
            // GO TO GAME OVER SCREEN
            timer.invalidate()
            
//            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let resultViewController = storyboard.instantiateViewController(identifier: "gameOver") as gameOverViewController
//            self.present(resultViewController, animated: true)
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "gameOver") as! gameOverViewController
//            vc.modalPresentationStyle = .fullScreen
            vc.completionHandler = { text in
                self.pointsScored.text = text
            }
            present(vc,animated: true)
        }
    }
    
    // Gets the answer to the equation
    func answer() -> Int {
        let product = randomNumberOne + randomNumberTwo
        return product
    }
    
    //  Updates the time and the points
    func updateUI() {
        timeLeft.text = String(secondsRemaining)
        pointsScored.text = String(points)
    }
    
    //  Grabs a new equation after the choice has been made
    func newEquation() {
        randomNumberOne = Int.random(in: 0...20)
        randomNumberTwo = Int.random(in: 0...20)
        number1.text = String(randomNumberOne)
        number2.text = String(randomNumberTwo)
        randomizingMultChoice()
    }
}
