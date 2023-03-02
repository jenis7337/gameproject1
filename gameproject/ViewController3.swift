import UIKit

class ViewController3: UIViewController {
    
    
    @IBOutlet weak var pg: UIProgressView!
    @IBOutlet weak var qeustionLabel: UILabel!
    @IBOutlet weak var qeustion2Label: UILabel!
    @IBOutlet weak var qeustionLabel3: UILabel!
    @IBOutlet weak var labelEqual: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var labelOfAnswer: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    var time1 = Timer()
    var freq = 0.1
    var a = 0
    var first = 0
    var second = 0
    var ans = 0
    var point = 0
    var highscore = UserDefaults.standard.integer(forKey: "highscore")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genret()
        pg.progress = 1.0
        progress()
        scoreLabel1()
    }
    func progress(){
        var a : Float = 1.0
        time1.invalidate()
        self.pg.progress = a
        time1 = Timer.scheduledTimer(withTimeInterval: freq, repeats: true, block: { (timer) in
            a -= 0.01
            self.pg.progress = a
            if self.pg.progress == 0.0{
                self.pg.progress = 1.0
                self.time1.invalidate()
                self.showAlert(title: "")
            }
        })
    }
    func scoreLabel1(){
        scoreLabel.layer.cornerRadius = 15
        scoreLabel.layer.masksToBounds = true
    }
    func genret(){
        var firstNumber = Int.random(in: 1...99)
        var secondNumber = Int.random(in: 50...99)
        var array = ["+","-"]
        var opretor = array.randomElement()
        qeustionLabel.text = "\(firstNumber)"
        qeustionLabel3.text = "\(secondNumber)"
        qeustion2Label.text = opretor
        let addition = firstNumber + secondNumber
        let subsraction = firstNumber - secondNumber
        if qeustionLabel3.text == "+" && qeustionLabel3.text == "-"{
            ans = firstNumber + secondNumber
        }else{

            ans = firstNumber - secondNumber
        }
        labelOfAnswer.text = "\(ans)"
    }
    func showAlert(title:String){
        let alert = UIAlertController(title: "Game Over", message: "Score:\(point)\n High score:\(highscore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Home", style: .default,handler: { _ in
            self.naviget()
        }))
        alert.addAction(UIAlertAction(title: "Restart", style: .default,handler: { _ in
            self.scoreLabel.text = "\(self.point -= self.point)"
            self.scoreLabel.text = "\(0)"
            self.progress()
            self.genret()
           
        }))
        present(alert, animated: true)
    }
    func naviget(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.popViewController(animated: false)
    }
    @IBAction func trueButtonAction(_ sender: UIButton) {
        if qeustionLabel3.text == "+" && qeustionLabel3.text == "-"{
            a+=1
            scoreLabel.text = "\(a)"
            ans = first + second
            genret()
           
        }else{
            a+=1
            scoreLabel.text = "\(a)"
            ans = first - second
            genret()
            
        }
        labelOfAnswer.text = "\(ans)"
       progress()
   }
   @IBAction func falseButtonAction(_ sender: UIButton) {
       if qeustionLabel3.text == "+" && qeustionLabel3.text == "-"{
           a+=1
           scoreLabel.text = "\(a)"
           ans = first + second
          genret()
           
       }else{
           a+=1
           scoreLabel.text = "\(a)"
           ans = first - second
           genret()
           
       }
       labelOfAnswer.text = "\(ans)"
       progress()
       
    }
}
