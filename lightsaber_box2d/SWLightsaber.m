//
//  SWLightsaber.m
//  lightsaber
//
//  Created by Lion User on 10/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SWLightsaber.h"

@implementation SWLightsaber

@synthesize sprite, direction;

-(id)initWithLayer:(CCLayer*)pLayer spriteTag:(int)tag
{
    if (self = [super init])
    {
        self->layer = pLayer;
        
        sprite = [CCSprite spriteWithFile: @"lightsaber.png"];
        sprite.position = ccp( 50, 100 );
        sprite.tag = tag;
        [pLayer addChild:sprite];
        
        direction = CGPointMake(0, 1);
        sprite.anchorPoint = CGPointMake(0.5, 0);
        
        rotateSpeed = 300;
    }
    
    return self;
}

-(void)update
{
    
}

-(void)moveLightsaber:(CGPoint)location
{    
    /* Rotate */
    // Calculate direction vector
    CGPoint newDirection = ccpSub(location, sprite.position);
    // Normalize direction
    newDirection = [SWUtility normalizeVector:newDirection];
    // Rotate
    float angle = CC_RADIANS_TO_DEGREES(ccpAngleSigned(newDirection, direction));
    sprite.rotation += angle;
    direction = newDirection;
        
    /* Move */
    sprite.position = location;
}

@end
