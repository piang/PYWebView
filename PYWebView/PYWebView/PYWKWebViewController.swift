//
//  SecondViewController.swift
//  PYWebView
//
//  Created by 洋 裴 on 16/9/5.
//  Copyright © 2016年 piang. All rights reserved.
//

import UIKit
import WebKit

class PYWKWebViewController: UIViewController,WKScriptMessageHandler {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let configuretion = WKWebViewConfiguration()
        configuretion.userContentController = WKUserContentController()
        /**
         * 声明JS对象标识
         **/
        configuretion.userContentController.addScriptMessageHandler(self, name: "pywebviewJS")
        
        let wkwebView = WKWebView(frame: self.view.frame,configuration: configuretion)
        self.view.addSubview(wkwebView)
        
        wkwebView.loadRequest(NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("index", ofType: "html")!)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        NSLog("%@", message.body.description)
    }

}

