//
//  ViewController.m
//  NHDynamicCellPro
//
//  Created by hu jiaju on 15/11/6.
//  Copyright © 2015年 hu jiaju. All rights reserved.
//

#import "ViewController.h"
#import "NHLableCellVCR.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Dynamic Cell";
    
    CGSize mainSize = [[UIScreen mainScreen] bounds].size;
    CGRect infoRect = CGRectMake(0, 100, mainSize.width, 50);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = infoRect;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"Label" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(labelEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)labelEvent {
    
    NHLableCellVCR *labelVCR = [[NHLableCellVCR alloc] init];
    [self.navigationController pushViewController:labelVCR animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
