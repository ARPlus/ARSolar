//
//  SettingViewController.m
//  ARSolar
//
//  Created by 文刀 on 2017/8/24.
//  Copyright © 2017年 wendao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CreditsViewController.h"
#import "BaiduMobStat.h"
@interface CreditsViewController ()
@property UIActivityIndicatorView *indicatorView;

@end

@implementation CreditsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[BaiduMobStat defaultStat] pageviewStartWithName:@"Credits"];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[BaiduMobStat defaultStat] pageviewEndWithName:@"Credits"];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}
- (IBAction)homeClicked:(id)sender {
    [self openUrl:@"https://github.com/miliPolo/ARSolarPlay"];
    [[BaiduMobStat defaultStat] logEvent:@"credits_home_click" eventLabel:@"home"];

    
}
- (IBAction)licenseClicked:(id)sender {
    [self openUrl:@"https://github.com/miliPolo/ARSolarPlay/blob/master/LICENSE.txt"];
    [[BaiduMobStat defaultStat] logEvent:@"credits_license_click" eventLabel:@"license"];


}



-(void)openUrl:(NSString*)url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}


- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (void)hideIndicator
{
    [self.indicatorView stopAnimating];
}
- (void)showIndicator
{
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:self.indicatorView];
    [self.indicatorView sizeToFit];
    [self.indicatorView startAnimating];
    self.indicatorView.center = self.view.center;
}


@end
