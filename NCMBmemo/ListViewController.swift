//
//  ListViewController.swift
//  NCMBmemo
//
//  Created by 吉田郭冶 on 2018/10/17.
//  Copyright © 2018年 吉田郭冶. All rights reserved.
//

import UIKit
import NCMB
class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var memoArray = [NCMBObject]()
    @IBOutlet var memoTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.dataSource = self
        memoTableView.delegate = self
        loadData()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text=memoArray[indexPath.row].object(forKey:"memo") as? String
        return cell!
    }
    func loadData(){
        
        let query = NCMBQuery(className :"Memo")
        query?.findObjectsInBackground({(result,error) in
            if error != nil{
                print(error)
            }else{
                self.memoArray = result as! [NCMBObject]
                self.memoTableView.reloadData()
            }
            }
            
        )
    }
}
