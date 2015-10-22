//
//  MainScene.m
//  MarioInCity
//
//  Created by Cuong Trinh on 7/27/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "MainScene.h"
#import "Sprite.h"
#import "City.h"
#import "Cloud.h"
#import "Windmill.h"
#import "Lady.h"
#import "Cow.h"

@implementation MainScene
{
    Lady *lady;
    Cow *cow;
    Windmill *windmill;
    City *grass;
    CGSize citySize;
    NSTimer *timer;
    Cloud *cloud1, *cloud2, *cloud3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    self.size = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - statusNavigationBarHeight);
    [self addGrassField];
    [self addClouds];
    [self addWindmill];
    [self addLady];
    [self addCow];
   
    timer = [NSTimer scheduledTimerWithTimeInterval:2
                                             target:self
                                           selector:@selector(gameloop)
                                           userInfo:nil
                                            repeats:true];
}
- (void) addGrassField {
    
    UIImage* grassfield = [UIImage imageNamed:@"city.jpg"];
    grass = [[City alloc] initWithName:@"grass"
                               ownView:[[UIImageView alloc] initWithImage:grassfield]
                               inScene:self];
    grass.view.frame = self.view.bounds;
    [self.view addSubview:grass.view];
   
}
- (void) addClouds {
    cloud1 = [[Cloud alloc] initWithName:@"cloud1"
                                 ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloud1.png"]]
                                 inScene:self]; cloud1.speed = - 50.0;
    cloud2 = [[Cloud alloc] initWithName:@"cloud2"
                                 ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloud2.png"]]
                                 inScene:self];cloud2.speed =  20.0;
    cloud3 = [[Cloud alloc] initWithName:@"cloud3"
                                 ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloud3.png"]]
                                 inScene:self];cloud3.speed =  60.0;
    cloud1.view.frame = CGRectMake(20, 15, 100, 100);
    cloud2.view.frame = CGRectMake(150, 3, 80, 80);
    cloud3.view.frame = CGRectMake(260, 7, 90, 90);
    [self addSprite:cloud1];
    [self addSprite:cloud2];
    [self addSprite:cloud3];
}
-(void) addWindmill {
    windmill = [[Windmill alloc] initWithName:@"windmill"
                                      inScene:self];
    windmill.view.center = CGPointMake(100, 200);
    [self addSprite:windmill];
    
}
-(void)addCow {
    cow = [[Cow alloc] initWithName:@"cow"
                                 inScene:self];
    cow.view.center =CGPointMake(250, self.view.bounds.size.height-125);
    printf("%3.0f",self.view.bounds.size.height);
    [self addSprite:cow];
}

-(void)addLady {
    lady = [[Lady alloc] initWithName:@"lady"
                               ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lady.jpg"]]
                               inScene:self];
    lady.view.frame =CGRectMake(self.view.bounds.size.width-180, self.view.bounds.size.height-215, 180, 205);
    [self addSprite:lady];
    
}

- (void) gameloop {
    
    for (Sprite *sprite in self.sprites.allValues) {
        [sprite animate];
    }
}

@end
