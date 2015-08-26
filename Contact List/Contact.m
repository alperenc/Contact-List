//
//  Contact.m
//  Contact List
//
//  Created by Alp Eren Can on 25/08/15.
//  Copyright © 2015 Alp Eren Can. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSString *)description
{
    NSString *description = [NSString stringWithFormat:@"Name: %@\n Email: %@\n", self.name, self.email];
    if (self.phoneNumbers) {
        for (NSString *key in self.phoneNumbers) {
            NSString *phoneNumber = [NSString stringWithFormat:@" %@: %@\n", key, [self.phoneNumbers objectForKey:key]];
            description = [description stringByAppendingString:phoneNumber];
        }
    }
    
    return description;
}

@end
