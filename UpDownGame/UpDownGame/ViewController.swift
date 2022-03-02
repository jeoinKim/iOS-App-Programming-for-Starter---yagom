//
//  ViewController.swift
//  UpDownGame
//
//  Created by JeongMin Kim on 2022/02/24.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .normal)
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .highlighted)
        reset()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider){
        print(sender.value)
        sliderValueLabel.text = String(Int(sender.value))
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        slider.value = Float(Int(slider.value))
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == Int(slider.value) {
            showAlert(message: "You Win!!")
            reset()
        } else if tryCount >= 5 {
            showAlert(message: "You Lose...")
            reset()
        } else if randomValue > Int(slider.value){
            slider.minimumValue = Float(Int(slider.value))
            minimumValueLabel.text = String(Int(slider.value))
        } else {
            slider.maximumValue = Float(Int(slider.value))
            maximumValueLabel.text = String(Int(slider.value))
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        reset()
        print("touch up reset button")
    }
    
    func reset(){
        print("reset!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
}

