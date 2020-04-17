//
//  ViewController.m
//  XL_TCPClientManager
//
//  Created by 李小龙 on 2020/4/17.
//  Copyright © 2020 李小龙. All rights reserved.
//

#import "ViewController.h"
#import "XLTCPClientManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //连接服务端
      [[XLTCPClientManager share]connect];
      
      //断开连接
      
      [[XLTCPClientManager share] disConnect];
      
      //发送数据
      
      NSData *data = [@"我是客户端" dataUsingEncoding:NSUTF8StringEncoding];
      
      [[XLTCPClientManager share]sendDataToServer:data];
}


@end
