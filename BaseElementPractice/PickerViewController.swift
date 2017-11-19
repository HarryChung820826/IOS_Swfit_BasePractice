//
//  PickerViewController.swift
//  BaseElementPractice
//
//  Created by HarryChung on 2017/11/2.
//  Copyright © 2017年 HarryChung. All rights reserved.
//

import UIKit

/*
 PickerView 
 
 1.繼承 UIPickerViewDataSource , UIPickerViewDelege 兩個 協定
 2.準備 資料 提供PickerView 要呈現的資料
 3.實作 numberOfComponents 設定要顯示幾個滾筒
 4.實作 pickerView:numberOfRowsInComponent & pickerView:titleForRow 設定 滾筒中的 數量 及 要呈現的姿料
 5.實作 pickerView:didSelectRow  取得使用者選取的資料
 
 */

class PickerViewController: MyBaseViewController,UIPickerViewDataSource , UIPickerViewDelegate{
    
    var listOne = [String]()
    var listTwo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.tag = "PickerViewControllerTAG"
        listOne.append("ItemOne")
        listOne.append("ItemTwo")
        listOne.append("ItemThree")
        
        listTwo.append("SubItemOne")
        listTwo.append("SubItemTwo")
        listTwo.append("SubItemThree")
    }
    
    // 產生幾個滾筒(Components)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //實作 pickerViwe :numberOfRowsInComponent 告訴 每個滾筒 有幾筆料
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return listOne.count
        }else{
            return listTwo.count
        }
    }
    
    //實作 pickerView :titleForRow 實際提供每個滾筒中 要顯示的資料
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return listOne[row]
        } else {
            return listTwo[row]
        }
    }
    
    //得知 使用者 選取的資料
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            print("listOne Choose \(listOne[row])")
        } else {
            print("listTwo Choose \(listTwo[row])")
        }
    }
}
