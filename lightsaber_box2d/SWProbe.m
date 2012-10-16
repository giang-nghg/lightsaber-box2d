//
//  SWProbe.m
//  lightsaber
//
//  Created by Lion User on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SWProbe.h"

@implementation SWProbe

@synthesize layer, lightsaber, bulletPool, sprite;

-(id) init:(CCLayer*)pLayer WithLightsaber:(SWLightsaber*)pLightsaber WithBulletPool:(NSMutableArray*)pBulletPool
{
    if (self = [super init])
    {
        self.layer = pLayer;
        self.lightsaber = pLightsaber;
        self.bulletPool = pBulletPool;
        
        sprite = [CCSprite spriteWithFile: @"probe.png"];
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        sprite.position = ccp( arc4random()%(int)winSize.width, arc4random()%(int)winSize.height );
        [pLayer addChild:sprite];             
    }
    
    return self;
}

-(void) update:(ccTime)dt
{
    // Move probe
    sprite.position = ccp( sprite.position.x + 100*dt, sprite.position.y);
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    if (sprite.position.x > winSize.width + sprite.contentSize.width/2) {
        sprite.position = ccp(-sprite.contentSize.width/2, sprite.position.y);
    }
}

-(void) probeShootBullet
{
    SWBullet* bullet = [[[SWBullet alloc] init] autorelease];
    [bullet initAtPosition:sprite.position WithLayer:self.layer WithLightsaber:self.lightsaber WithBulletPool:self.bulletPool spriteTag:TAG_SPRITE_BULLET];
}

@end
