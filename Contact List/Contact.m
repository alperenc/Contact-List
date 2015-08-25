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
    return [NSString stringWithFormat:@"Name: %@\n Email: %@", self.name, self.email];
}

@end
