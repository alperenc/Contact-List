//
//  ContactList.m
//  Contact List
//
//  Created by Alp Eren Can on 25/08/15.
//  Copyright © 2015 Alp Eren Can. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

-(instancetype)init {
    self = [super init];
    
    if (self) {
        self.list = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)addContact:(Contact *)newContact {
    
    [self.list addObject:newContact];
    NSLog(@"Contact successfully added to contact list.");
    
}

- (NSString *)description
{
    NSString *description = @"";
    for (Contact *contact in self.list) {
        description = [NSString stringWithFormat:@"%lu: <%@> (%@)", (unsigned long)[self.list indexOfObject:contact], contact.name, contact.email];
    }
    return description;
}

@end
