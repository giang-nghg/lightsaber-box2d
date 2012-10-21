//
//  SWProbe.h
//  lightsaber
//
//  Created by Lion User on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SWBullet.h"
#import "SWLightsaber.h"

@interface SWProbe : NSObject
{
    // Pointer to level layer
    CCLayer* layer;
    
    // Probe sprite
    CCSprite* sprite;
    
    // Pointer to lightsaber
    SWLightsaber* lightsaber;
    
    // Pointer to bullet pool
    NSMutableArray* bulletPool;
    
    // Pointer to probe swarm
    NSMutableArray* swarm;
    
    CCParticleSystem* particle;
}

@property(assign) CCLayer* layer;
@property(assign) SWLightsaber* lightsaber;
@property(assign) NSMutableArray* bulletPool;
@property(assign) CCSprite* sprite;

-(id)init:(CCLayer*)pLayer WithLightsaber:(SWLightsaber*)pLightsaber WithBulletPool:(NSMutableArray*)pBulletPool probeSwarm:(NSMutableArray*)pSwarm;
-(void)probeShootBullet;

@end
