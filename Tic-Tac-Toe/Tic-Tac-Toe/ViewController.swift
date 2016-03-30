//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Eric Sinovic on 3/29/16.
//  Copyright © 2016 Eric Sinovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var space1: UIImageView!
    @IBOutlet weak var space2: UIImageView!
    @IBOutlet weak var space3: UIImageView!
    @IBOutlet weak var space4: UIImageView!
    @IBOutlet weak var space5: UIImageView!
    @IBOutlet weak var space6: UIImageView!
    @IBOutlet weak var space7: UIImageView!
    @IBOutlet weak var space8: UIImageView!
    @IBOutlet weak var space9: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var playerTurn = true
    var moves = [Int] (count: 9, repeatedValue: 2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "Welcome to Tic-Tac-Toe!"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func computerTurn(){

        statusLabel.text = "The computer is choosing its move..."
        
        //make it seem like computer is taking a turn
        for _ in 0...100000000{
            
        }
        var buttons = [button1, button2, button3, button4, button5, button6, button7, button8, button9]
        var spaces = [space1, space2, space3, space4, space5, space6, space7, space8, space9]
        
        var goodMove = false
        var moveToMake = 5
        while !goodMove {
            moveToMake = Int(arc4random_uniform(9))
            if moves[moveToMake] == 2{
                goodMove = true
            }
        }
        buttons[moveToMake].userInteractionEnabled = false
        let image = UIImage(named: "Shield")! as UIImage
        spaces[moveToMake].image = image
        moves[moveToMake] = 0
        checkWin(0)
        statusLabel.text = "Your Move!"
        playerTurn = true
    }
    
    func reset(){
        space1.image = nil
        space2.image = nil
        space3.image = nil
        space4.image = nil
        space5.image = nil
        space6.image = nil
        space7.image = nil
        space8.image = nil
        space9.image = nil
        
        button1.userInteractionEnabled = true
        button2.userInteractionEnabled = true
        button3.userInteractionEnabled = true
        button4.userInteractionEnabled = true
        button5.userInteractionEnabled = true
        button6.userInteractionEnabled = true
        button7.userInteractionEnabled = true
        button8.userInteractionEnabled = true
        button9.userInteractionEnabled = true
        
        moves = [2,2,2,2,2,2,2,2,2]
        statusLabel.text = "The Board Has Been Reset!"
        playerTurn = true
    }
    
    func finished(){
        exit(0)
    }
    
    func checkWin(turn: Int){
        var message = ""
        var spacesLeft = false
        switch (turn){
        case 1: message = "Congratulations! You Win!"
            break
        case 0: message = "Sorry, but HAL prevailed today..."
            break
        default: break
        }
        
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Play Again", style: .Default) { _ in self.reset() }
        let noAction = UIAlertAction(title: "I'm finished here", style: .Default) {_ in self.finished()}
        alert.addAction(action)
        alert.addAction(noAction)
        if moves[0] == turn && moves[1] == turn && moves[2] == turn {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if moves[3] == turn && moves[4] == turn && moves[5] == turn {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if moves[6] == turn && moves[7] == turn && moves[8] == turn {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if moves[0] == turn && moves[3] == turn && moves[6] == turn {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if moves[1] == turn && moves[4] == turn && moves[7] == turn {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if moves[2] == turn && moves[5] == turn && moves[8] == turn {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if moves[0] == turn && moves[4] == turn && moves[8] == turn {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if moves[2] == turn && moves[4] == turn && moves[6] == turn {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        for i in moves {
            if i == 2{
                spacesLeft = true
            }
        }
        if spacesLeft == false {
            reset()
        }
        return
    }
    
    @IBAction func buttonWasPressed(sender: UIButton) {
        if playerTurn == true{
            let button = sender
            let image = UIImage(named: "Sword")! as UIImage
            switch (button.tag){
            case 1: space1.image = image
                break
            case 2: space2.image = image
                break
            case 3: space3.image = image
                break
            case 4: space4.image = image
                break
            case 5: space5.image = image
                break
            case 6: space6.image = image
                break
            case 7: space7.image = image
                break
            case 8: space8.image = image
                break
            case 9: space9.image = image
                break
            default: break
            }
            moves[button.tag-1]=1
            button.userInteractionEnabled = false
            checkWin(1)
            playerTurn = false
            computerTurn()
        }
    }
    
}

