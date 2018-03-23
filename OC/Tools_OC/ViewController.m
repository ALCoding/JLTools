//
//  ViewController.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/16.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonCrypto.h>
#import "NSString+Encryption.h"
#import "GTMBase64.h"

#import "UILabel+Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "UIButton+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
//    [self action];
}

- (void)creatUI {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    btn.center = self.view.center;
    [btn setTitle:@"Action" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"icon_C_1"] forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor whiteColor];
    btn.backgroundColor = [UIColor darkGrayColor];
    btn.layer.cornerRadius = 5.0;
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    [btn leftTitleAndRightImageFits];
//    [btn topImageAndBottomTitleFits:16.0];
    
    [self.view addSubview:btn];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" tintColor:[UIColor darkGrayColor] target:self action:@selector(action)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_C_1"] target:self action:@selector(action)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)action {
    NSLog(@"------ Normal action");
}


@end
