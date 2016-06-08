//
//  RankingViewController.swift
//  BarabaraGame
//
//  Created by Paul McCartney on 2016/06/09.
//  Copyright © 2016年 shiba. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {

    @IBOutlet var rankingLabel1: UILabel!
    @IBOutlet var rankingLabel2: UILabel!
    @IBOutlet var rankingLabel3: UILabel!
    
    let ud: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        rankingLabel1.text = String(ud.integerForKey("score1"))
        rankingLabel2.text = String(ud.integerForKey("score2"))
        rankingLabel3.text = String(ud.integerForKey("score3"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func toTop() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
