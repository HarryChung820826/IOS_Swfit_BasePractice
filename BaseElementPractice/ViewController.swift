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
        showDialog()
        
    }
    @IBAction func BtnClick(_ sender: Any) {
        showDialog()
    }
    
    private func showDialog(){
        //have .alert and .actionsheet two style
        let alertController = UIAlertController(
            title: "AlertTitle",
            message: "AlertMessage",
            preferredStyle: .alert)
        
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
}

