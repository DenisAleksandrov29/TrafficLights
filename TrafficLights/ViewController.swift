//
//  ViewController.swift
//  TrafficLights
//
//  Created by Денис Александров on 12.04.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorRed: UIImageView!
    @IBOutlet var colorYellow: UIImageView!
    @IBOutlet var colorGreen: UIImageView!
    @IBOutlet var actionButton: UIButton!
    
    var isStart = true
    var currentState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorRed.alpha = 0.5
        colorYellow.alpha = 0.5
        colorGreen.alpha = 0.5
        actionButton.layer.cornerRadius = 10
        
    }
    // MARK: - Colors
    @IBAction func startAndNextTapped(_ sender: UIButton) {
        
        switch currentState {
        case 0:
            startAction()
        case 1:
            nextYellow()
        case 2:
            nextGreen()
        default:
            currentState = 0
            startAction()
        }
        
        isStart.toggle()
        updateButton()
        flashButton()
    }
    
    // MARK: - Methods
    private func startAction() {
        colorRed.alpha = 1.0
        colorYellow.alpha = 0.5
        colorGreen.alpha = 0.5
        currentState = 1
    }
    
    private func nextYellow() {
        colorRed.alpha = 0.5
        colorYellow.alpha = 1.0
        colorGreen.alpha = 0.5
        currentState = 2
    }
    
    private func nextGreen() {
        colorRed.alpha = 0.5
        colorYellow.alpha = 0.5
        colorGreen.alpha = 1.0
        currentState = 0
    }
    
    // MARK: - Switching Button
    private func updateButton() {
        let buttonTitle = currentState == -1 ? "Start" : "Next"
        actionButton.setTitle(buttonTitle, for: .normal)
    }
    
    private func flashButton() {
        UIView.animate(withDuration: 0.05, animations: {
            self.actionButton.titleLabel?.alpha = 0.1
        }) { _ in
            UIView.animate(withDuration: 0.05) {
                self.actionButton.titleLabel?.alpha = 1.0
            }
        }
    }
}

