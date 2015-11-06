//
//  ViewController.swift
//  Calculator
//
//  Created by Alexander Besson on 2015-11-05.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation {
        case Divide
        case Multiply
        case Add
        case Subtract
        case Clear
        case Empty
    }
    
    @IBOutlet weak var lblCounter: UILabel!
    
    var buttonSound = AVAudioPlayer()
    
    var runningNumber = ""
    var leftValueString = ""
    var rightValueString = ""
    var result = ""
    var currentOperation : Operation = .Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
        } catch let err as NSError {
            print(err.debugDescription)
        }

        
        
    }
    @IBAction func numberPressed(btn: UIButton) {
        playSound()
        
        runningNumber += "\(btn.tag)"
        lblCounter.text = runningNumber
    }
    
    @IBAction func btnMinusPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func btnPlusPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func btnDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func btnMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func btnEqualsPressed(sender: AnyObject) {
        
        if currentOperation != .Empty {
            processOperation(currentOperation)
        } else {
            
        }
        
        
    }
    
    @IBAction func btnClear(sender: AnyObject) {
        playSound()
        
        currentOperation = .Empty
        result = ""
        runningNumber = ""
        leftValueString = ""
        rightValueString = ""
        lblCounter.text = ""
        
    }
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperation != .Empty {
            
            if runningNumber != "" {
                rightValueString = runningNumber
                runningNumber = ""
                
                if currentOperation == .Multiply {
                    result = "\(Double(leftValueString)! * Double(rightValueString)!)"
                } else if currentOperation == .Divide {
                    result = "\(Double(leftValueString)! / Double(rightValueString)!)"
                } else if currentOperation == .Add {
                    result = "\(Double(leftValueString)! + Double(rightValueString)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(leftValueString)! - Double(rightValueString)!)"
                }
                
                leftValueString = result
                lblCounter.text = result
 
            }
            
            currentOperation = op
            
        } else {
            leftValueString = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound() {
        if buttonSound.playing {
            buttonSound.stop()
            
        }
        buttonSound.play()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

