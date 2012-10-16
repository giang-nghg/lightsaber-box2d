//
//  SWBullet.m
//  lightsaber
//
//  Created by Lion User on 10/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SWBullet.h"

@implementation SWBullet

@synthesize isOut, sprite;

-(void)initAtPosition:(CGPoint)pos WithLayer:(CCLayer*)pLayer WithLightsaber:(SWLightsaber*)pLightsaber WithBulletPool:(NSMutableArray*)pBulletPool spriteTag:(int)tag
{
    isOut = false;
    
    self->layer = pLayer;
    self->lightsaber = pLightsaber;
    self->bulletPool = pBulletPool;
    
    speed = 10000;
    
    isSafeToIntersect = true;
    
    /* Create bullet */
    sprite = [CCSprite spriteWithFile: @"bullet.png"];
    sprite.position = pos;
    sprite.tag = tag;
    [pLayer addChild:sprite];
    [pBulletPool addObject:self];
        
    [layer addBoxBodyForSprite:sprite];
    
    /* Program bullet's movement */
    direction = ccpSub(lightsaber.sprite.position, sprite.position);
    direction = [SWUtility normalizeVector:direction];
    [self moveAction];
}

-(void)update:(ccTime)dt
{
    // Out of field? Bye!
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    if (sprite.position.x >= winSize.width + sprite.contentSize.width/2 || sprite.position.x < -sprite.contentSize.width/2 || sprite.position.y >= winSize.height + sprite.contentSize.height/2 || sprite.position.y < -sprite.contentSize.height/2)
    {
        isOut = true;
        return;
    }
    
//    if (!CGRectIntersectsRect(sprite.boundingBox, lightsaber.sprite.boundingBox) && !isSafeToIntersect)
//    {
//        isSafeToIntersect = true;
//    }
//    
//    // Deflect bullet
//    if (CGRectIntersectsRect(sprite.boundingBox, lightsaber.sprite.boundingBox) && isSafeToIntersect)
//    {
//        isSafeToIntersect = false;
//        
//        [sprite stopActionByTag:TAG_ACTION_BULLET_MOVE];
//        CGPoint temp = ccpSub(lightsaber.direction, direction);
//        direction = ccpAdd(lightsaber.direction, temp);
//        [self moveAction];       
//    }
}

-(void)deflectedMove
{
    [sprite stopActionByTag:TAG_ACTION_BULLET_MOVE];
    CGPoint temp = ccpSub(lightsaber.direction, direction);
    direction = ccpAdd(lightsaber.direction, temp);
    [self moveAction];
}

-(void)moveAction
{
    double time = 1 / speed;
    CCAction* action = [CCRepeatForever actionWithAction:[CCMoveBy actionWithDuration:time position:direction]];
    [action setTag:TAG_ACTION_BULLET_MOVE];
    [sprite runAction:action];
}

@end
