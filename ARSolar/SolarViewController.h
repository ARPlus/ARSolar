//
//  SolarViewController.h
//  ARSolar
//
//  Created by wendao on 2017/9/27.
//  Copyright © 2017年 wendao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SolarViewController : UIViewController

typedef enum : NSInteger {
    defaultPlanet = 0,
    SolarPlanet = 1,
    MercuryPlanet = 2,
    VenusPlanet = 3,
    EarthPlanet = 4,
    MoonPlanet = 5,
    MarsPlanet = 6,
    JupiterPlanet = 7,
    SaturnPlanet = 8,
    UranusPlanet = 9,
    NeptunePlanet = 10,
    PlutoPlanet = 11
}PlanetName;

@property (nonatomic, assign) PlanetName planetName;

@end


