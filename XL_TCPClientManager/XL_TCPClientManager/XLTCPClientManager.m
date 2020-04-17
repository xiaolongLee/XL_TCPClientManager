//
//  XLTCPClientManager.m
//  XL_TCPClientManager
//
//  Created by 李小龙 on 2020/4/17.
//  Copyright © 2020 李小龙. All rights reserved.
//

#import "XLTCPClientManager.h"
#import "GCDAsyncSocket.h"

@interface XLTCPClientManager()<GCDAsyncSocketDelegate>
{
    GCDAsyncSocket *gcdSocket;
}
@end

@implementation XLTCPClientManager

//TCP长连接客户端
+(instancetype)share{
    
    static dispatch_once_t onceToken;
    
    static XLTCPClientManager *manager = nil;
    
    dispatch_once(&onceToken, ^{
       
        manager = [[self alloc]init];
        
        [manager setupSocket];
    });
    
    return manager;
}
- (void)setupSocket{
    
    gcdSocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
}
//建立连接 请求服务端
- (BOOL)connect
{
    return [gcdSocket connectToHost:@"服务端IP地址 如:172.20.10.1" onPort:8000 error:nil];
}
//主动断开连接
- (void)disConnect
{
    [gcdSocket disconnect];
}
//连接成功调用
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    [gcdSocket readDataWithTimeout:-1 tag:0];
}
//断开连接的时候调用
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(nullable NSError *)err
{
    NSLog(@"%@",[err localizedDescription]);
}
//发送数据
- (void)sendDataToServer:(NSData *)data{
    
    [gcdSocket writeData:data withTimeout:-1 tag:0];
}
//接收到数据的回调
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    [gcdSocket readDataWithTimeout:-1 tag:0];
}



@end
