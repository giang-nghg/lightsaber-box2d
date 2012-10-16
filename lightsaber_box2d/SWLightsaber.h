//
//  SWLightsaber.h
//  lightsaber
//
//  Created by Lion User on 10/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SWUtility.h"

@interface SWLightsaber : NSObject
{
    // Lighsaber
    CCSprite* sprite;    
    
    // Pointer to level layer
    CCLayer* layer;
    
    // Lightsaber's direction (vector)
    CGPoint direction;
    
    float rotateSpeed;
}

@property(assign) CCSprite* sprite;
@property(assign) CGPoint direction;

-(id)initWithLayer:(CCLayer*)pLayer spriteTag:(int)tag;
-(void)moveLightsaber:(CGPoint)location;
-(void)update;

@end
