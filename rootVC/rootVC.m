//
//  rootVC.m
//  bothCentralPeripheral
//
//  Created by ChenHong on 2018/1/29.
//  Copyright © 2018年 macro-c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "rootVC.h"

@interface rootVC()

@property (nonatomic ,strong) UILabel *peripheral;
@property (nonatomic ,strong) UILabel *central;
@property (nonatomic ,strong) UIButton *connectTwo;

// 外设部分
@property (nonatomic, strong) CBPeripheralManager *peripheralManager; //外设
@property (nonatomic, strong) CBMutableCharacteristic *charact;
@property (nonatomic, strong) NSString *serviceUUID;
@property (nonatomic, strong) NSString *characterUUID;
@property (nonatomic, strong) NSMutableArray<CBCentral *> *centrals;


// central部分
@property (nonatomic ,strong) CBCentralManager *CBCenterManager;
@property (nonatomic, strong) NSMutableArray *deviceArray;


@end


@implementation rootVC

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) loadView {
    
    [super loadView];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor grayColor];
}

- (void) viewDidLoad {
    
    [super viewDidLoad];

    // 外设部分
    self.centrals = [[NSMutableArray alloc] init];
    self.serviceUUID = @"68753A44-4D6F-1226-9C60-0050E4C00067";
    self.characterUUID = @"68753A44-4D6F-1226-9C60-0050E4C00068";
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    
    
    // central部分
    self.CBCenterManager = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
    self.deviceArray = [[NSMutableArray alloc] init];
    
    
    [self createUI];
    
}

- (void) createUI {
    
    self.peripheral = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    self.central = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-130, 10, 110, 50)];
    self.peripheral.backgroundColor = [UIColor whiteColor];
    self.central.backgroundColor = [UIColor whiteColor];
    [self.peripheral setText:@"外设功能侧"];
    [self.central setText:@"central功能侧"];
    
    self.connectTwo = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 -40, 20, 65, 40)];
    [self.connectTwo setTitle:@"connectTwo" forState:UIControlStateNormal];
    self.connectTwo.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.connectTwo];
    [self.view addSubview:self.peripheral];
    [self.view addSubview:self.central];
}


@end
