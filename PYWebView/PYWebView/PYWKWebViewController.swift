//
//  SecondViewController.swift
//  PYWebView
//
//  Created by 洋 裴 on 16/9/5.
//  Copyright © 2016年 piang. All rights reserved.
//

import UIKit
import WebKit

class PYWKWebViewController: UIViewController,WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate {

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
        wkwebView.navigationDelegate = self;
        wkwebView.UIDelegate = self;
        self.view.addSubview(wkwebView)
        
        wkwebView.loadRequest(NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("index", ofType: "html")!)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        webView.evaluateJavaScript("callbackJSAlert('jsAlertAction')", completionHandler: nil)
    }

    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        
        /**
         * 执行JS调用的方法
         **/
        
        NSLog("%@", message.body.description)
    }
    
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        
        let alertController = UIAlertController(title:"提示", message:message,preferredStyle:UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title:"确认",style:UIAlertActionStyle.Default,handler:{
            _ in
            completionHandler();
        }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

}

