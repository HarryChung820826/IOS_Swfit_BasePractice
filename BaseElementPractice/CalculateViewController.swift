//
//  CalculateViewController.swift
//  BaseElementPractice
//
//  Created by HarryChung on 2017/11/5.
//  Copyright © 2017年 HarryChung. All rights reserved.
//

import UIKit

class CalculateViewController : MyBaseViewController{
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var ButtonReturnToZero: UIButton!
    @IBOutlet weak var ButtonDot: UIButton!  // .
    @IBOutlet weak var ButtonPosOrNe: UIButton!// 正/負
    @IBOutlet weak var ButtonPercentage: UIButton! //百分比
    @IBOutlet weak var ButtonExcept: UIButton! // 除
    @IBOutlet weak var ButtonMultiply: UIButton!// 乘
    @IBOutlet weak var ButtonLess: UIButton! //減
    @IBOutlet weak var ButtonPlus: UIButton! //加
    @IBOutlet weak var ButtonEqual: UIButton! //等於
    @IBOutlet weak var ButtonOne: UIButton!
    @IBOutlet weak var ButtonTwo: UIButton!
    @IBOutlet weak var ButtonThree: UIButton!
    @IBOutlet weak var ButtonFour: UIButton!
    @IBOutlet weak var ButtonFive: UIButton!
    @IBOutlet weak var ButtonSix: UIButton!
    @IBOutlet weak var ButtonSeven: UIButton!
    @IBOutlet weak var ButtonEight: UIButton!
    @IBOutlet weak var ButtonNine: UIButton!
    @IBOutlet weak var ButtonZero: UIButton!
    
    
    var result :Int? = 0
    var CalculateTypeDictionary = [UIButton : String]() //計算方式 標記
    var CalculateType : String! = ""
    override func viewDidLoad() {
        CalculateTypeDictionary[ButtonPlus] = "Plus"
        CalculateTypeDictionary[ButtonLess] = "Less"
        CalculateTypeDictionary[ButtonMultiply] = "Multiply"
        CalculateTypeDictionary[ButtonExcept] = "Except"
    }
    
    @IBAction func btnClick(_ sender: Any){
        
        let target = sender as! UIButton;
        
        switch target{
        case ButtonReturnToZero:
            result! = 0
            break;
        case ButtonOne:
            ShowResult(result:Calculate(input:1));
            break;
        case ButtonTwo:
            ShowResult(result:Calculate(input:2));
            break;
        case ButtonThree:
            ShowResult(result:Calculate(input:3));
            break;
        case ButtonFour:
            ShowResult(result:Calculate(input:4));
            break;
        case ButtonFive:
            ShowResult(result:Calculate(input:5));
            break;
        case ButtonSix:
            ShowResult(result:Calculate(input:6));
            break;
        case ButtonSeven:
            ShowResult(result:Calculate(input:7));
            break;
        case ButtonEight:
            ShowResult(result:Calculate(input:8));
            break;
        case ButtonNine:
            ShowResult(result:Calculate(input:9));
            break;
        case ButtonZero:
            ShowResult(result:Calculate(input:0));
            break;
        case ButtonDot:
            break;
        case ButtonPosOrNe:
            break;
        case ButtonPercentage:
            break;
        case ButtonLess , ButtonPlus , ButtonMultiply , ButtonExcept:
            ChangeCalculateType(btn: target)
            break;
        default :
            break;
        
        }
        
    }
    
    private func Calculate(input:Int) -> Int{
        switch (CalculateType){
            case "Plus":
                return PlusCalculate(input: input)
            case "Less":
                return LessCalculate(input: input)
            case "Multiply":
                return MultiplyCalculate(input: input)
            case "Except":
                return ExceptCalculate(input: input)
            default :
                return input
        }
        return 0;
    }
    
    private func ChangeCalculateType(btn:UIButton!){
        CalculateType! = CalculateTypeDictionary[btn]!
        print("CalculateType Change To : \(CalculateType)")
    }
    
    private func PlusCalculate(input:Int) -> Int{
        result! = result! + input;
        return result!;
    }
    
    private func LessCalculate(input:Int) -> Int{
        result! = result! - input;
        return result!;
    }
    
    private func MultiplyCalculate(input:Int) -> Int{
        result! = result! * input;
        return result!;
    }
    
    private func ExceptCalculate(input:Int) -> Int{
        result! = result! / input;
        return result!;
    }
    
    private func ShowResult(result:Int){
        ResultLabel.text = String(result)
        
    }
    
}


