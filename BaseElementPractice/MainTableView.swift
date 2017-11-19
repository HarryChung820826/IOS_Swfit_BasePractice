//
//  MainTableView.swift
//  BaseElementPractice
//
//  Created by HarryChung on 2017/11/12.
//  Copyright © 2017年 HarryChung. All rights reserved.
//

import UIKit

class MainTableView : NSObject,UITableViewDataSource , UITableViewDelegate{
    
    var list = [String]()
    
    
    init(sourceData source:[String]){
        //self.list = source;
        self.list.append("KKBOX");
        self.list.append("DDSTU");
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //表格上有幾個區段Section
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //各個區段顯示幾個Cell
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //withIdentifier: "Cell" --> 檢查"Cell" 記憶體池(memory pool) 是否有閒置的記憶體 回傳 閒置的記憶體 給要顯示的cell 使用 ; 沒有就產生新的cell
        // indexPath --> 標記是哪一個Cell
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        
        cell.textLabel?.text  = list[indexPath.row]
        return cell
    }
}
