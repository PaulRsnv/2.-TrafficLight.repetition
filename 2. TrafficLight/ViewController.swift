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
    private let lightIsOff: CGFloat = 0.3
    private let lightIsOn: CGFloat = 1
    
    
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColorView.alpha = lightIsOff
        orangeColorView.alpha = lightIsOff
        greenColorView.alpha = lightIsOff
        
        startButton.configuration = setupButton("START")
    }
    
    override  func viewWillLayoutSubviews() {
        redColorView.layer.cornerRadius = redColorView.frame.width / 2
        orangeColorView.layer.cornerRadius = orangeColorView.frame.width / 2
        greenColorView.layer.cornerRadius = greenColorView.frame.width / 2
    
    }
    @IBAction func startButtonTapped() {
       
        switch currentLight {
            
        case .red:
            greenColorView.alpha = lightIsOff
            redColorView.alpha = lightIsOn
            currentLight = .orange
            startButton.configuration = setupButton("NEXT")
        case .orange:
            redColorView.alpha = lightIsOff
            orangeColorView.alpha = lightIsOn
            currentLight = .green
        case .green:
            orangeColorView.alpha = lightIsOff
            greenColorView.alpha = lightIsOn
            currentLight = .red
        }
    }
    
    private func setupButton(_ title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = title
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.8756956183, green: 0.6727778949, blue: 1, alpha: 1)
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 25)
        return buttonConfiguration
    }
}


// MARK: - CurrentLight

extension ViewController {
    enum CurrentLight {
        case red, orange, green
    }
}
