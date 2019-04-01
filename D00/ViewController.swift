//
//  ViewController.swift
//  D00
//
//  Created by Pikaliuk DEMIAN on 4/1/19.
//  Copyright © 2019 Pikaliuk DEMIAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numOutput : Double = 0
    var firstNum : Double = 0
    var mathOperator : Bool = false
    var operation : Int = 0
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func digits(_ sender: UIButton)
    {
        if mathOperator
        {
            resultLabel.text = String(sender.tag)
            mathOperator = false
        }
        else
        {
            resultLabel.text = resultLabel.text! + String(sender.tag)
        }
        numOutput = numOutput + Double(resultLabel.text!)!
        if sender.tag == 16
        {
            numOutput = -numOutput
            resultLabel.text = String(numOutput)
        }
    }
    @IBAction func functionsButtons(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 15 && sender.tag != 10
        {
            firstNum = Double(resultLabel.text!)!
            if sender.tag == 11    // '/'
            {
                resultLabel.text = "/"
            }
            else if sender.tag == 12     // 'x'
            {
                resultLabel.text = "x"
            }
            else if sender.tag == 13     // '-'
            {
                resultLabel.text = "-"
            }
            else if sender.tag == 14     // '+'
            {
                resultLabel.text = "+"
            }
            operation = sender.tag
            mathOperator = true
        }
        else if sender.tag == 10
        {
            resultLabel.text = ""
            numOutput = 0
            operation = 0
            firstNum = 0
        }
        else if sender.tag == 15
        {
            if operation == 11
            {
                resultLabel.text = String(firstNum / numOutput)
            }
            else if operation == 12
            {
                resultLabel.text = String(firstNum * numOutput)
            }
            else if operation == 13
            {
                resultLabel.text = String(firstNum - numOutput)
            }
            else if operation == 14
            {
                resultLabel.text = String(firstNum + numOutput)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let color1 = UIColor(red: 153 / 255, green: 26 / 255, blue: 61 / 255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 243 / 255, green: 155 / 255, blue: 51 / 255, alpha: 1.0).cgColor
        let color3 = UIColor(red: 222 / 255, green: 121 / 255, blue: 69 / 255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillDisappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("deinit")
    }
}

