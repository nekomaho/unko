//
//  ResultController.swift
//  unko
//
//  Created by msatoru on 2018/06/21.
//  Copyright © 2018年 msatoru. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var textResult:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = textResult
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
