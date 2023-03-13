import UIKit

class ViewController3: UIViewController {
    
    var time1 = Timer()
    var freq = 0.1
    var score = 0
    var first = 0
    var second = 0
    var ans = 0
    var array2 = [Int]()
    var point = 0
    var highscore = 0
    var abc = 0
    
//    var highscore = UserDefaults.standard.integer(forKey: "highscore")
    
    @IBOutlet weak var pg: UIProgressView!
    @IBOutlet weak var qeustionLabel: UILabel!
    @IBOutlet weak var opretorOfLabel: UILabel!
    @IBOutlet weak var qeustionLabel3: UILabel!
    @IBOutlet weak var labelEqual: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var labelOfAnswer: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genret()
        pg.progress = 1.0
        progress()
        scoreLabel1()
      
        score = point
       highscore = score
        updatehighscore()
        self.updatehighscore()
       
    }
    func updatehighscore(){
        if score > highscore
        {
            highscore = score
//            UserDefaults.standard.set(highscore, forKey: "highscore")
        }
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
                self.updatehighscore()
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
        var secondNumber = Int.random(in: 1...99)
        
        var array = ["+","-"]
        var opretor = array.randomElement()
        
        var addition = firstNumber + secondNumber
        var subsraction = firstNumber - secondNumber
        
        opretorOfLabel.text = opretor

        if opretorOfLabel.text == "+"{
            ans = addition
        }
        else{
            ans = subsraction
        }
        
        var randomAnswer = Int.random(in: 1...200)
        var array2 = [ans,randomAnswer]
        array2.shuffle()
        qeustionLabel.text = "\(firstNumber)"
        qeustionLabel3.text = "\(secondNumber)"
        abc = array2.randomElement() ?? 0
        labelOfAnswer.text = "\(Int(abc ?? 0))"
    
    }
    func showAlert(title:String){
        let alert = UIAlertController(title: "Game Over", message: "Score:\(score)\n High score:\(highscore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Home", style: .default,handler: { _ in
            self.naviget()
        }))
        alert.addAction(UIAlertAction(title: "Restart", style: .default,handler: { _ in
            self.scoreLabel.text = "\(self.point -= self.point)"
            self.score = 0
            self.scoreLabel.text = "0"
            self.progress()
            self.genret()
            self.updatehighscore()
           
        }))
        present(alert, animated: true)
    }
    func naviget(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.popViewController(animated: false)
    }
    @IBAction func trueButtonAction(_ sender: UIButton) {
        print("true \(abc)")
        if labelOfAnswer.text == "\(ans)" && (abc != 0)  {
            score+=1
            scoreLabel.text = "\(score)"
            genret()
            
        }
        else{
            showAlert(title: "game over")
        }
       progress()
   }
   @IBAction func falseButtonAction(_ sender: UIButton) {
       if labelOfAnswer.text == "\(abc)"  && (ans != 0) {
           score+=1
           scoreLabel.text = "\(score)"
          
          genret()
           
       }
       else{
          showAlert(title: "game over")
       }
       progress()
       
    }
}
