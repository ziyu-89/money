import UIKit

class moneyViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    //Stepper
    @IBOutlet weak var oneStepper: UIStepper!
    @IBOutlet weak var fiveStepper: UIStepper!
    @IBOutlet weak var tenStepper: UIStepper!
    @IBOutlet weak var fiftyStepper: UIStepper!
    @IBOutlet weak var onehundredStepper: UIStepper!
    @IBOutlet weak var onethousandStepper: UIStepper!
    @IBOutlet weak var fivehundredStepper: UIStepper!
    
    //Label
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var tenLabel: UILabel!
    @IBOutlet weak var fiftyLabel: UILabel!
    @IBOutlet weak var onehundredLabel: UILabel!
    @IBOutlet weak var onethousandLabel: UILabel!
    @IBOutlet weak var fivehundredLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var buy: UIButton!
    
    var number : Int = 0
    var price = [1515,2021,512]
    var sum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = String("")
        buy.layer.borderWidth = 2
    }
    
    //SegmentedControl
    @IBAction func imagechange(_ sender: UISegmentedControl) {
        number = sender.selectedSegmentIndex
        if number == 0{
            image.image = UIImage(named: "food\(number)")
            foodPriceLabel.text = "$ 1 5 1 5 "
        }
        else if number == 1{
            image.image = UIImage(named: "food\(number)")
            foodPriceLabel.text = "$ 2 0 2 1"
        }
        else{
            image.image = UIImage(named: "food\(number)")
            foodPriceLabel.text = "$ 5 1 2"
        }
        restart()
        textLabel.text = String("")
    }
    
    @IBAction func foodStepper(_ sender: UIStepper) {
        let one = Int(oneStepper.value)
        let five = Int(fiveStepper.value)
        let ten = Int(tenStepper.value)
        let fifty = Int(fiftyStepper.value)
        let onehundred = Int(onehundredStepper.value)
        let onethousand = Int(onethousandStepper.value)
        let fivehundred = Int(fivehundredStepper.value)
        sum(one: one, five: five, ten: ten, fifty: fifty, onehundred: onehundred, onethousand: onethousand, fivehundred: fivehundred)

    }
    
    
    @IBAction func buyButton(_ sender: UIButton) {
        count(number: number)
    }
    
    @IBAction func clear(_ sender: Any) {
        restart()
    }
    
    func sum(one: Int,five: Int,ten: Int,fifty: Int,onehundred: Int,onethousand: Int,fivehundred: Int){
        sum = one + five * 5 + ten * 10 + fifty * 50 + onehundred * 100 + onethousand * 1000 + fivehundred * 500
        sumLabel.text = String("$ \(sum)")
        oneLabel.text = String(one)
        fiveLabel.text = String(five)
        tenLabel.text = String(ten)
        fiftyLabel.text = String(fifty)
        onehundredLabel.text = String(onehundred)
        onethousandLabel.text = String(onethousand)
        fivehundredLabel.text = String(fivehundred)
    }
    
    
    //Label更改為０
    func restart(){
        sumLabel.text = String("0")
        oneLabel.text = String("0")
        fiveLabel.text = String("0")
        tenLabel.text = String("0")
        fiftyLabel.text = String("0")
        onehundredLabel.text = String("0")
        onethousandLabel.text = String("0")
        fivehundredLabel.text = String("0")
        oneStepper.value = 0
        fiveStepper.value = 0
        tenStepper.value = 0
        fiftyStepper.value = 0
        onehundredStepper.value = 0
        onethousandStepper.value = 0
        fivehundredStepper.value = 0
        textLabel.text = String("")
    }
    
    //計算
    func count(number : Int){
        let money : Int = price[number] - sum
        if money < 0{
            textLabel.text = String("找您：$\(abs(money))！")}
        else if money > 0{
            textLabel.text = String("錢還不夠喔！")}
        else{
            textLabel.text = String("錢剛剛好喔！")}
    }
}
