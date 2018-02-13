//
//  rootVC.h
//  bothCentralPeripheral
//
//  Created by ChenHong on 2018/1/29.
//  Copyright © 2018年 macro-c. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface rootVC : UIViewController <CBPeripheralManagerDelegate ,CBCentralManagerDelegate>


@end

