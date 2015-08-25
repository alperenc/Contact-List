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
        
        Contact *firstContact = [[Contact alloc] init];
        firstContact.name = @"A E C";
        firstContact.email = @"alp@can.com";
        [contacts addContact:firstContact];
        
        Contact *secondContact = [[Contact alloc] init];
        secondContact.name = @"C O";
        secondContact.email = @"ceren@oksuz.com";
        [contacts addContact:secondContact];
        
        Contact *thirdContact = [[Contact alloc] init];
        thirdContact.name = @"O C";
        thirdContact.email = @"onur@candar.com";
        [contacts addContact:thirdContact];
        
        while (repeat) {
            InputCollector *inputCollector = [[InputCollector alloc] init];
            
            NSString *cmd = [inputCollector inputForPrompt:@"What would you like to do next?\n new - Create a new contact\n show - Show contact details\n list - List all contacts\n quit - Exit Application"];
            
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
                NSLog(@"%@", contacts);
                
            } else if ([cmd isEqualToString:@"show"]) {
                
                NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
                numberFormatter.numberStyle = NSNumberFormatterNoStyle;
                
                bool contactShown = NO;
                while (!contactShown) {
                    NSNumber *index = [numberFormatter numberFromString:[inputCollector inputForPrompt:@"Index: "]];
                    if (index.intValue < 0 || index.intValue >= contacts.list.count) {
                        NSLog(@"not found");
                    } else {
                        NSLog(@"%@", contacts.list[index.intValue]);
                        contactShown = YES;
                    }
                }
                
            } else {
                NSLog(@"Not a valid input");
            }
        }
    }
    return 0;
}
