import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PLayButton: UIButton!
    @IBOutlet weak var pg: UIProgressView!
    @IBOutlet weak var loadingLabel: UILabel!
    var time = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        pg.progress = 0.0
        loadingLabel.isHidden = true
        pg.isHidden = true
  }
    func progress(){
        var a : Float = 0.0
        self.pg.progress = a
        time = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (timer) in
            a += 0.02
            self.pg.progress = a
            if self.pg.progress == 1.0{
                self.pg.progress = 0.0
self.showAlert(title: " 1. There will be one math equation.       2. if equation is right,press'FALSE'.     3.if equation is right,press'TRUE'")
               
                self.naviget()
                self.time.invalidate()
            }
        })
    }
   func showAlert(title:String){
        let alert = UIAlertController(title: "", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play", style: .default,handler: { _ in
            self.naviget()
        }))
       present(alert, animated: true)
  }
    func naviget(){
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(n, animated: true)
    }
    @IBAction func PlayButtonAction(_ sender: Any) {
        loadingLabel.isHidden = false
        pg.isHidden = false
        progress()
   }
}

