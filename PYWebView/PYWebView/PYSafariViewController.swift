//
//  PYSafariViewController.swift
//  PYWebView
//
//  Created by 洋 裴 on 16/9/7.
//  Copyright © 2016年 piang. All rights reserved.
//

import UIKit
import SafariServices

class PYSafariViewController: UIViewController {
    
    @IBAction func presentSafari(sender: AnyObject) {
        
        /**
         * 仅仅支持打开远程连接，并且js与原生无法交互
         **/
        
        self.presentViewController(SFSafariViewController(URL: NSURL(string: "http://www.baidu.com")!), animated: true, completion: nil)
    }
}
