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
        case Equals
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
        buttonSound.play()
    }
    
    @IBAction func btnMinusPressed(sender: AnyObject) {
        
    }
    
    @IBAction func btnPlusPressed(sender: AnyObject) {
        
    }
    
    @IBAction func btnDividePressed(sender: AnyObject) {
        
    }
    
    @IBAction func btnMultiplyPressed(sender: AnyObject) {
        
    }
    
    @IBAction func btnEqualsPressed(sender: AnyObject) {
        
    }
    
    @IBAction func btnClear(sender: AnyObject) {
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

