//
//  XLTCPClientManager.h
//  XL_TCPClientManager
//
//  Created by 李小龙 on 2020/4/17.
//  Copyright © 2020 李小龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLTCPClientManager : NSObject
+(instancetype)share;

- (BOOL)connect;

- (void)disConnect;

- (void)sendDataToServer:(NSData *)data;
@end

NS_ASSUME_NONNULL_END
