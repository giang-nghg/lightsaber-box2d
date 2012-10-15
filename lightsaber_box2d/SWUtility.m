//
//  SWUtility.m
//  lightsaber
//
//  Created by Lion User on 10/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SWUtility.h"

@implementation SWUtility

+(CGPoint)normalizeVector:(CGPoint)vector
{
    double magnitude = sqrt(vector.x*vector.x + vector.y*vector.y);
    vector = CGPointMake(vector.x/magnitude, vector.y/magnitude);
    return vector;
}

@end
