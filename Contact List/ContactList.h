//
//  ContactList.h
//  Contact List
//
//  Created by Alp Eren Can on 25/08/15.
//  Copyright © 2015 Alp Eren Can. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Contact;

@interface ContactList : NSObject

@property (nonatomic, strong) NSMutableArray *list;

-(instancetype)init;
-(void)addContact:(Contact *)newContact;

@end
