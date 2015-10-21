//
//  Windmill.m
//  DutchLady
//
//  Created by student on 10/21/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "Windmill.h"

@implementation Windmill

- (instancetype) initWithName:(NSString *)name
                      inScene:(Scene *)scene {
    
    self = [super initWithName:name
                       inScene:scene];
    UIImageView* WindmillView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 180, 250)];
    
    WindmillView.userInteractionEnabled = true;
    WindmillView.multipleTouchEnabled = true;
    
    WindmillView.animationImages = @[
                                  [UIImage imageNamed:@"1.png"],
                                  [UIImage imageNamed:@"2.png"],
                                  [UIImage imageNamed:@"3.png"],
                                  [UIImage imageNamed:@"4.png"],
                                  ];
    WindmillView.animationDuration = 1.0;
    [WindmillView startAnimating];
    self.view = WindmillView;
return self;
}
@end
