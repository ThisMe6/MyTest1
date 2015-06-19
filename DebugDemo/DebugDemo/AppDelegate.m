//
//  AppDelegate.m
//  DebugDemo
//
//  Created by ice on 15/5/25.
//  Copyright (c) 2015年 ice. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    return YES;
}

void UncaughtExceptionHandler(NSException *exception) {
    /**
     *  获取异常崩溃信息
     */
    NSArray *callStack = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *content = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[callStack componentsJoinedByString:@"\n"]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *voiceDirectory = [documentsDirectory stringByAppendingPathComponent:@"buglog"];
    if ( ! [[NSFileManager defaultManager] fileExistsAtPath:voiceDirectory]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:voiceDirectory withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    NSString *logPath=[voiceDirectory stringByAppendingPathComponent:@"/errorLog.txt"];
    NSLog(@"=====%@", logPath);
    
    NSFileHandle *fileHandle=[NSFileHandle fileHandleForUpdatingAtPath:logPath];
    NSData *bugData=[content dataUsingEncoding:NSUTF8StringEncoding];
    [fileHandle writeData:bugData];
    [fileHandle closeFile];
    
    [bugData writeToFile:logPath atomically:YES];
    
}

@end
