//
//  HelloWorldLayer.h
//  lightsaber_box2d
//
//  Created by Lion User on 10/15/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "MyContactListener.h"
#import "SWLightsaber.h"
#import "SWProbe.h"
#import "SWUtility.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    b2World* world;
	GLESDebugDraw *m_debugDraw;
    
    MyContactListener *_contactListener;
    
    // Lighsaber
    SWLightsaber* lightsaber;
    
    // Array of probes
    NSMutableArray* probes;
    
    // Bullet pool
    NSMutableArray* bulletPool;
}

@property(assign) b2World* world;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
// adds a new sprite at a given coordinate
//-(void) addNewSpriteWithCoords:(CGPoint)p;
- (void)addBoxBodyForSprite:(CCSprite *)sprite;
- (void)spriteDone:(id)sender;

@end
