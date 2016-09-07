//
//  PYWebViewModel.swift
//  PYWebView
//
//  Created by 洋 裴 on 16/9/6.
//  Copyright © 2016年 piang. All rights reserved.
//

import JavaScriptCore
import UIKit

@objc protocol PYWebViewJSExport:JSExport {
    func pyNSLog(string:String) -> Void
}

class PYWebViewModel: NSObject,PYWebViewJSExport {
    
    func pyNSLog(string:String) -> Void {
        NSLog("%@",string)
    }

}
