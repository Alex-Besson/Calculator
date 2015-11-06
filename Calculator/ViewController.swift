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
    
    var runninngNumber = ""
    var leftValueString = ""
    var rightValueString = ""
    var currentOperation: Operation = .Empty
    
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
        
        runninngNumber += "\(btn.tag)"
        lblCounter.text = runninngNumber
    }
    
    @IBAction func btnMinusPressed(sender: AnyObject) {
        playSound()
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
        processOperation(currentOperation)
    }
    
    @IBAction func btnClear(sender: AnyObject) {
        processOperation(Operation.Clear)
    }
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperation != .Empty {
            runninngNumber = rightValueString
            rightValueString = ""
            
        } else {
            leftValueString = runninngNumber
            runninngNumber = ""
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

