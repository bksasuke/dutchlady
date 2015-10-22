//
//  Cow.m
//  DutchLady
//
//  Created by student on 10/21/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "Cow.h"

@implementation Cow
{
    UIImageView *CowView;
}
- (instancetype) initWithName:(NSString *)name
                      inScene:(Scene *)scene {
    
    self = [super initWithName:name
                       inScene:scene];
    CowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 220, 180)];
    
    CowView.userInteractionEnabled = true;
    CowView.multipleTouchEnabled = true;
    
    CowView.animationImages = @[
                                     [UIImage imageNamed:@"cow1.png"],
                                     [UIImage imageNamed:@"cow2.png"],
                                     [UIImage imageNamed:@"cow3.png"],
                                     [UIImage imageNamed:@"cow4.png"],
                                     [UIImage imageNamed:@"cow5.png"],
                                     [UIImage imageNamed:@"cow6.png"],
                                     [UIImage imageNamed:@"cow7.png"],
                                     ];
    CowView.animationDuration = 3.0;
    [CowView startAnimating];
    
    self.view = CowView;
    return self;
   
}
-(void) movingDairyCow {
    CowView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:5 animations:^{
        CowView.center =CGPointMake(250-100, 310);
    } completion:^(BOOL finished) {
        CowView.transform = CGAffineTransformMakeScale(-1, 1);
        [UIView animateWithDuration:5 animations:^{
            CowView.center = CGPointMake(250+100, 305);
        } completion:^(BOOL finished){
            [self movingDairyCow];
        }];
        
    }];
}

-(void) animate {
    [self movingDairyCow];
}

@end
