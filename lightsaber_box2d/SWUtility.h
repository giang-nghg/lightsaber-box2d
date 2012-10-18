//
//  SWUtility.h
//  lightsaber
//
//  Created by Lion User on 10/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define MAX_PROBES 3
#define TAG_SPRITE_LIGHTSABER 1
#define TAG_SPRITE_BULLET 2
#define TAG_SPRITE_BULLET_COLLIDED 3
#define TAG_SPRITE_BULLET_DEFLECTED 4
#define TAG_SPRITE_PROBE 5
#define TAG_SPRITE_PROBE_HIT 6
#define TAG_ACTION_BULLET_MOVE 7

@interface SWUtility : NSObject

+(CGPoint)normalizeVector:(CGPoint)vector;

@end
