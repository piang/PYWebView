//
//  FirstViewController.swift
//  PYWebView
//
//  Created by 洋 裴 on 16/9/5.
//  Copyright © 2016年 piang. All rights reserved.
//

import JavaScriptCore
import UIKit

class PYUIWebViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet var pyUIWebView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
        pyUIWebView.backgroundColor = UIColor.clearColor()
        pyUIWebView.loadRequest(NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("index", ofType: "html")!)))
        pyUIWebView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        /**
         * 根据对特殊的url做处理，来触发原生的代码
         **/
        
        if (((request.URL?.description)! as NSString).hasPrefix("pywebview")) {
            
            /**
             * 原生代码示例：打印了字符串;
             **/
            
            NSLog("%@", ((request.URL?.description)! as NSString).substringFromIndex(12))
            
            return false
        }
        return true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        let context = webView.valueForKeyPath("documentView.webView.mainFrame.javaScriptContext") as! JSContext
        
        /**
         * 注入JS对应的原生对象
         **/
        context.setObject(PYWebViewModel(), forKeyedSubscript:"pywebviewJS")
        
        /**
         * 调用js方法
         **/
        //context.evaluateScript("callbackJSAlert('jsAlertAction')");

    }


}

