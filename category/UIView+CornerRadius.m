//
//  UIView+CornerRadius.m
//  HotFixDemo
//
//  Created by wzx on 2017/12/19.
//Copyright © 2017年 topcheer. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}


@end
