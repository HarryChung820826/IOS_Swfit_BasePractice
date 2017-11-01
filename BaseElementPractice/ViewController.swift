//
//  ViewController.swift
//  BaseElementPractice
//
//  Created by HarryChung on 2017/10/31.
//  Copyright © 2017年 HarryChung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //UIAlertController 必須等到 View Controller 載入後 才能顯示 ; 因此在viewDidAppear 中處理
        showDialog()
        
    }
    var lock:Bool = true
    @IBAction func BtnClick(_ sender: Any) {
        if(lock){
            showDialog()
        }else{
            showTextFieldDialog()
        }
        lock = !lock
    }
    
    //顯示一個 訊息框
    private func showDialog(){
        //have .alert and .actionsheet two style
        let alertController = UIAlertController(
            title: "AlertTitle",
            message: "AlertMessage",
            preferredStyle: .actionSheet)
        
        //Declare a button
        let okAction = UIAlertAction(
            title: "ok",
            style: .default)
            //this block section is click listener
        {
            (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(okAction)
        //show alert , like android's alert.show();
        show(alertController, sender: self)
    }
    
    //利用訊息框輸入資料
    private func showTextFieldDialog(){
        let alert = UIAlertController(
            title: "Login Message",
            message: "Input Account and Password",
            preferredStyle: .alert)
        //取消按鈕
        let cancelAction = UIAlertAction(
            title: "Cancel"
            , style: .cancel)
        {
            (action) in self.dismiss(animated: true, completion: nil)
        }
        //登入按鈕
        let loginAction = UIAlertAction(
            title:"Login"
        ,style:.default)
        {
            (action) in
            let uid = alert.textFields![0].text
            let pwd = alert.textFields![1].text
            
            print("Account :  \(uid)")
            print("Password :  \(pwd)")
        }
        
        //產生第一個文字輸入框
        alert.addTextField{
            (textField) in
            textField.placeholder = "Login"
        }

        alert.addTextField{
            (textField) in
            textField.placeholder = "Password"
            //密碼型態
            textField.isSecureTextEntry =  true
        }
        
        alert.addAction(cancelAction)
        alert.addAction(loginAction)
        show(alert, sender: self)
    }
}

