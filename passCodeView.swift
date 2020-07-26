//
//  passCodeView.swift
//  passCodeDemo
//
//  Created by 林祐辰 on 2020/7/26.
//  Copyright © 2020 smirkiiiv. All rights reserved.
//

import UIKit

class passCodeView: UIViewController {

    
    
    @IBOutlet weak var firstNumImage: UIImageView!
    @IBOutlet weak var secondNumImage: UIImageView!
    @IBOutlet weak var thirdNumImage: UIImageView!
    @IBOutlet weak var fourthNumImage: UIImageView!
    
 
    @IBOutlet weak var collectView: UIView!
    
    @IBOutlet weak var bgOne: UIImageView!
    @IBOutlet weak var bgTwo: UIImageView!
    
    @IBOutlet weak var hintLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         createPassCode()
    }
    
    var numberMap = ["0","1","2","3","4","5","6","7","8","9"]
    var PassCodeCollection = [String]()
    var finalCode = ""
    var inputNum = ""
    
    
    struct defaultSet{
        static var image = UIImage(named: "birdy")
    }
    
    
    
    func createPassCode(){
        
        for _ in 0...3{
            let pickedNum = Int.random(in: 0...numberMap.count-1)
            let passedNum = numberMap.remove(at: pickedNum)
            PassCodeCollection.append(passedNum)
        }
        
        finalCode = PassCodeCollection.joined(separator: "")
        
        print("Correct Code : \(finalCode)")
        
    }


    
    @IBAction func inputOne(_ sender: UIButton) {
        didInputNum(index:"1")
        check()
    }
    

    @IBAction func inputTwo(_ sender: UIButton) {
        didInputNum(index:"2")
        check()
    }
    
    
    @IBAction func inputThree(_ sender: UIButton) {
        didInputNum(index:"3")
        check()
    }
    
    
    @IBAction func inputFour(_ sender: UIButton) {
        didInputNum(index:"4")
        check()
    }
    
    
    @IBAction func inputFive(_ sender: UIButton) {
        didInputNum(index:"5")
        check()
    }
    
    @IBAction func inputSix(_ sender: UIButton) {
        didInputNum(index:"6")
    }
    
    @IBAction func inputSeven(_ sender: UIButton) {
        didInputNum(index:"7")
        check()
    }
    
    
    @IBAction func inputEight(_ sender: UIButton) {
        didInputNum(index:"8")
        check()
    }
    
    
    @IBAction func inputNine(_ sender: Any) {
        didInputNum(index:"9")
        check()
    }
    
    @IBAction func inputZero(_ sender: UIButton) {
        didInputNum(index:"0")
        check()
    }
    
    @IBAction func deleteNum(_ sender: UIButton) {
      removeInputNum()
    renderDefaultPic()

    }
    
    
    func didInputNum(index:String){
            inputNum += index
            renderCodeImage()
    }
    
    
 func removeInputNum(){
    if(inputNum.count>0 && inputNum.count<finalCode.count){
        inputNum.removeLast()
    }
 }
    
func renderCodeImage(){
    let countNumHelper = inputNum.count

    switch countNumHelper{
        case 1:
          firstNumImage.image = UIImage(named: "snoopOne")
        case 2:
          secondNumImage.image = UIImage(named: "snoopTwo")
        case 3:
          thirdNumImage.image = UIImage(named: "snoopThree")
        case 4:
          fourthNumImage.image = UIImage(named: "snoopFour")
        default:
            restartTyping()
        }
    }

    
  func renderDefaultPic(){
    let deleteNumHelper = inputNum.count+1
    switch deleteNumHelper{
       case 3:
         thirdNumImage.image = defaultSet.image
       case 2:
         secondNumImage.image = defaultSet.image
       case 1:
         firstNumImage.image = defaultSet.image
       default:
           restartTyping()
       }
        
        
    }

    func check(){
        if inputNum.count == finalCode.count{
           print(inputNum)
           inputNum == finalCode ? successAlert():restartTyping()
        }
    }
    
    func successAlert(){
        let alert = UIAlertController(title: "密碼正確", message: "請稍候", preferredStyle: .alert)
        let action = UIAlertAction(title: "好喔", style: .default) {_ in
            self.clearAll()
            self.inputNum = ""
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
   
    func restartTyping(){
      hintLabel.text = "您所輸入的密碼有誤！ 請再試一次"
       firstNumImage.image = defaultSet.image
       secondNumImage.image = defaultSet.image
       thirdNumImage.image = defaultSet.image
       fourthNumImage.image = defaultSet.image
       inputNum = ""
        
        let codeShake = CABasicAnimation(keyPath: "position")
        codeShake.duration = 0.085
        codeShake.repeatCount = 3
        codeShake.fromValue = NSValue(cgPoint: CGPoint(x: collectView.center.x - 10, y: collectView.center.y))
        codeShake.toValue = NSValue(cgPoint: CGPoint(x: collectView.center.x + 10, y: collectView.center.y))

        collectView.layer.add(codeShake, forKey: "position")
    }
    
    func clearAll(){
        hintLabel.text = "Loading...."
        firstNumImage.image = defaultSet.image
        secondNumImage.image = defaultSet.image
        thirdNumImage.image = defaultSet.image
        fourthNumImage.image = defaultSet.image
        inputNum = ""
    }
}
