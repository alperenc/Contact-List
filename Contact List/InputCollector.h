//
//  InputCollector.h
//  Contact List
//
//  Created by Alp Eren Can on 25/08/15.
//  Copyright © 2015 Alp Eren Can. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

@property (nonatomic) NSMutableArray *commands;

-(NSString *)inputForPrompt:(NSString *)promptString;

@end
