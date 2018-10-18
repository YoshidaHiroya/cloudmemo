//
//  AddMemoViewController.swift
//  NCMBmemo
//
//  Created by 吉田郭冶 on 2018/10/17.
//  Copyright © 2018年 吉田郭冶. All rights reserved.
//

import UIKit
import NCMB
class AddMemoViewController: UIViewController {

    @IBOutlet var memoTextView :UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        memoTextView.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(){
        let object = NCMBObject(className:"Memo")
        object?.setObject(memoTextView.text, forKey: "memo")
        object?.saveInBackground({ (error) in
            if error != nil{
            print(error)
            }else{
                let allertController = UIAlertController(title:"保存完了",message:"メモの保存が完了しました。メモ一覧に戻る。",preferredStyle:.alert)
                let action = UIAlertAction(title:"ok",style:.default, handler:{(action) in
                self.navigationController?.popViewController(animated: true)
            })
        allertController.addAction(action)
                self.present(allertController,animated:true,completion:nil)
            }
            })
    }
}
