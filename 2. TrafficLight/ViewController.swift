//
//  ViewController.swift
//  2. TrafficLight
//
//  Created by Oxyenniu on 05.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redColorView: UIView!
    @IBOutlet weak var orangeColorView: UIView!
    @IBOutlet weak var greenColorView: UIView!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOFf: CGFloat = 0.3
    
    
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColorView.alpha = lightIsOFf
        orangeColorView.alpha = lightIsOFf
        greenColorView.alpha = lightIsOFf
        
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = #colorLiteral(red: 0.8756956183, green: 0.6727778949, blue: 1, alpha: 1)
        startButton.tintColor = .black
        startButton.configuration?.attributedTitle?.font = UIFont.systemFont(ofSize: 24)
    }
    override func viewWillLayoutSubviews() {
        redColorView.layer.cornerRadius = redColorView.frame.height / 2
        orangeColorView.layer.cornerRadius = orangeColorView.frame.height / 2
        greenColorView.layer.cornerRadius = greenColorView.frame.height / 2
    }
    @IBAction func tuppedButton() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenColorView.alpha = lightIsOFf
            redColorView.alpha = lightIsOn
            currentLight = .orange
        case .orange:
            redColorView.alpha = lightIsOFf
            orangeColorView.alpha = lightIsOn
            currentLight = .green
        case .green:
            orangeColorView.alpha = lightIsOFf
            greenColorView.alpha = lightIsOn
            currentLight = .red
        }
    }
}

// MARK: - Current Light

extension ViewController {
    enum CurrentLight {
        case red, orange, green
    }
}
