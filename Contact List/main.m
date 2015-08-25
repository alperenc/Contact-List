//
//  main.m
//  Contact List
//
//  Created by Alp Eren Can on 25/08/15.
//  Copyright © 2015 Alp Eren Can. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "InputCollector.h"
#include "Contact.h"
#include "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        bool repeat = YES;
        
        ContactList *contacts = [[ContactList alloc] init];
        
        while (repeat) {
            InputCollector *inputCollector = [[InputCollector alloc] init];
            
            NSString *cmd = [inputCollector inputForPrompt:@"What would you like to do next?\n new - Create a new contact\n list - List all contacts\n quit - Exit Application"];
            
            if ([cmd isEqualToString:@"quit"]) {
                repeat = NO;
                NSLog(@"Adéu!");
            } else if ([cmd isEqualToString:@"new"]) {
                NSString *name = [inputCollector inputForPrompt:@"Name: "];
                NSString *email = [inputCollector inputForPrompt:@"Email: "];
                
                Contact *contact = [[Contact alloc] init];
                contact.name = name;
                contact.email = email;
                
                [contacts addContact:contact];
                
            } else if ([cmd isEqualToString:@"list"]) {
                
            } else {
                NSLog(@"Not a valid input");
            }
        }
    }
    return 0;
}
