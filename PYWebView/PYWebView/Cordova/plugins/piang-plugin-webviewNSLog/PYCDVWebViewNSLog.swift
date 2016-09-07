//
//  PYCDVWebViewNSLog.swift
//  PYWebView
//
//  Created by 洋 裴 on 16/9/7.
//  Copyright © 2016年 piang. All rights reserved.
//

@objc(PYCDVWebViewNSLog) class PYCDVWebViewNSLog: CDVPlugin {

    func pyNSLog(command:CDVInvokedUrlCommand) -> Void {
        NSLog("%@", command.argumentAtIndex(0) as! String)
    }
    
}
