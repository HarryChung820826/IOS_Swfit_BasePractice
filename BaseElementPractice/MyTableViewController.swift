//
//  MyTableViewController.swift
//  BaseElementPractice
//
//  Created by HarryChung on 2017/11/12.
//  Copyright © 2017年 HarryChung. All rights reserved.
//

import UIKit

class MyTableViewController :UIViewController,UITableViewDataSource , UITableViewDelegate{
    
    var list = [String]()
    private var nowIsEdit :Bool = false
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var SelectBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initListData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //TableView進入編輯模式
        myTableView.isEditing = false
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
    
    
    //判斷哪一個 cell 被點擊 方法一 實作tableView：didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showMyDialog(title: "Use didSelectRowAt",content: list[indexPath.row])
    }
    
    //判斷哪一個 cell 被點擊 方法二 tableView 拉藍線 建立關聯變數  使用變數 取得 選取的cell
    @IBAction func SelectBtnClick(_ sender: Any) {
        /*
        if let indexPath = myTableView.indexPathForSelectedRow{
            showMyDialog(title: "Use indexPathForSelectedRow", content: list[indexPath.row])
        }
         */
        /*
         變更編輯/非編輯狀態
        nowIsEdit = !nowIsEdit
        setTableViewModel(isEdit: nowIsEdit);
         */
        
        reloadMyTableView()
    }
    
    
    /*改變Cell 順序 三個步驟
        1.viewDidAppear 中 myTableView.isEditing = true
        2.實作 canMoveRowAt -> return true
        3.實作 canMoveRowAt to -> 處理 陣列中順序 與畫面上順序
     */
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tmp = list[sourceIndexPath.row]
        list.remove(at: sourceIndexPath.row)
        list.insert(tmp, at: sourceIndexPath.row)
        print("sourceIndexPath : \(sourceIndexPath)")
        print("sourceIndexPath.row : \(sourceIndexPath.row)")
        for str in list{
            print("\(str)")
        }
        print("---------")
    }
    
    /*
    //將cell 設定為編輯模式不可刪除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
     */
    
    //刪除資料與cell tableView :commit editingStyle
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //刪除陣列中的資料
        list.remove(at: indexPath.row)
        
        //刪除cell
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    //實作 tableView : titleForDeleteConfirmationButtonForRowAt 回傳 顯示的 文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "刪除"
    }
    
    private func initListData(){
        self.list.append("KKBOX");
        self.list.append("DDSTU");
    }
    
    private func reloadMyTableView(){
        initListData()
        myTableView.reloadData()
    }
    
    private func setTableViewModel(isEdit:Bool){
        myTableView.setEditing(isEdit, animated: true)
    }
    
    
    private func showMyDialog(title:String , content:String){
        let dialog = UIAlertController(
            title: title,
            message: content,
            preferredStyle: .alert)
        
        let actionOk = UIAlertAction(
            title: "ok",
            style: .default)
        
        dialog.addAction(actionOk)
        show(dialog,sender: self)
    }
    
}
