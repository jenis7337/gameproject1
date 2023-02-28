import UIKit

class ViewController2: UIViewController {
    
@IBOutlet weak var easyButton: UIButton!
@IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func easyButtonAction(_ sender: Any) {
        naviget()
    }
    
    @IBAction func mediumButtonAction(_ sender: Any) {
        naviget1()
    }
  @IBAction func HardButtonAction(_ sender: Any) {
      naviget2()
    }

    func naviget(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        n.freq = 0.090
        navigationController?.pushViewController(n, animated: true)
    }
    func naviget1(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        n.freq = 0.050
        navigationController?.pushViewController(n, animated: true) 
    }
    func naviget2(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        n.freq = 0.020
        navigationController?.pushViewController(n, animated: true)
    }
    

}
