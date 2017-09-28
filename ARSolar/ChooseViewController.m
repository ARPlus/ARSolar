//
//  SettingViewController.m
//  ARSolar
//
//  Created by 文刀 on 2017/8/24.
//  Copyright © 2017年 wendao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChooseViewController.h"
#import "BaiduMobStat.h"
@interface ChooseViewController ()


@end

@implementation ChooseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[BaiduMobStat defaultStat] pageviewStartWithName:@"Choose"];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[BaiduMobStat defaultStat] pageviewEndWithName:@"Choose"];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (IBAction)solarClicked:(id)sender {
    self.solarView.planetName = SolarPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_solar_click" eventLabel:@"点击"];

    
}
- (IBAction)earthClicked:(id)sender {
    self.solarView.planetName = EarthPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_earth_click" eventLabel:@"点击"];
}

- (IBAction)moonClicked:(id)sender {
    self.solarView.planetName = MoonPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_moon_click" eventLabel:@"点击"];
}
- (IBAction)marsClicked:(id)sender {
    self.solarView.planetName = MarsPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_mars_click" eventLabel:@"点击"];

}

- (IBAction)saturnClicked:(id)sender {
    self.solarView.planetName = SaturnPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_saturn_click" eventLabel:@"点击"];

}

- (IBAction)plutoClicked:(id)sender {
    self.solarView.planetName = PlutoPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_pluto_click" eventLabel:@"点击"];

}
- (IBAction)mercuryClicked:(id)sender {
    self.solarView.planetName = MercuryPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_mercury_click" eventLabel:@"点击"];

}
- (IBAction)venusClicked:(id)sender {
    self.solarView.planetName = VenusPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_venus_click" eventLabel:@"点击"];

}
- (IBAction)jupiterClicked:(id)sender {
    self.solarView.planetName = JupiterPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_jupiter_click" eventLabel:@"点击"];

}

- (IBAction)uranusClicked:(id)sender {
    self.solarView.planetName = UranusPlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_uranus_click" eventLabel:@"点击"];

}

- (IBAction)neptuneClicked:(id)sender {
    self.solarView.planetName = NeptunePlanet;
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_neptune_click" eventLabel:@"点击"];

}



- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion: ^{
    }];
    [[BaiduMobStat defaultStat] logEvent:@"choose_close_click" eventLabel:@"点击"];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


@end
