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
    // Out of field OR hit? Bye!
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    if (sprite.position.x >= winSize.width + sprite.contentSize.width/2 || sprite.position.x < -sprite.contentSize.width/2 || sprite.position.y >= winSize.height + sprite.contentSize.height/2 || sprite.position.y < -sprite.contentSize.height/2
        
        || sprite.tag == TAG_SPRITE_BULLET_HIT)
    {
        isOut = true;
        return;
    }
    
    // Deflect bullet
    if (sprite.tag == TAG_SPRITE_BULLET_COLLIDED)
    {
        sprite.tag = TAG_SPRITE_BULLET_DEFLECTED;
        [self deflectedMove];        
    }
}

-(void)deflectedMove
{
    [sprite stopActionByTag:TAG_ACTION_BULLET_MOVE];
    CGPoint temp = ccpSub(lightsaber.direction, direction);
    temp = [SWUtility normalizeVector:temp];
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

-(void)dealloc
{
    [layer spriteDone:sprite];
    
    [super dealloc];
}

@end
