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
        
        InputCollector *inputCollector = [[InputCollector alloc] init];
        inputCollector.commands = [[NSMutableArray alloc] init];
        
        while (repeat) {
            
            NSString *cmd = [inputCollector inputForPrompt:@"\nWhat would you like to do next?\n new - Create a new contact\n find - Find contact\n show - Show contact details\n list - List all contacts\n quit - Exit Application\n > "];
            
            NSArray *cmdArray = [cmd componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            if (cmdArray.count == 2) {
                if ([cmdArray[0] isEqualToString:@"show"]) {
                    [inputCollector.commands addObject:cmd];
                    
                    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
                    numberFormatter.numberStyle = NSNumberFormatterNoStyle;
                    
                    bool contactShown = NO;
                    while (!contactShown) {
                        NSNumber *index = [numberFormatter numberFromString:cmdArray[1]];
                        if (index.intValue < 0 || index.intValue >= contacts.list.count) {
                            NSLog(@"not found");
                        } else {
                            NSLog(@"%@", contacts.list[index.intValue]);
                            contactShown = YES;
                        }
                    }
                    
                } else if ([cmdArray[0] isEqualToString:@"find"]) {
                    [inputCollector.commands addObject:cmd];
                    
                    bool contactFound = NO;
                    for (Contact *contact in contacts.list) {
                        if ([[contact.name lowercaseString] rangeOfString:[cmdArray[1] lowercaseString]].length != 0 ||
                            [[contact.email lowercaseString] rangeOfString:[cmdArray[1] lowercaseString]].length != 0) {
                            contactFound = YES;
                            NSLog(@"%@", contact);
                        }
                        
                        if (!contactFound) {
                            NSLog(@"not found");
                        }
                    }
                    
                } else {
                    NSLog(@"Not a valid input");
                }
            } else if(cmdArray.count == 1) {
            
                if ([cmd isEqualToString:@"quit"]) {
                    [inputCollector.commands addObject:cmd];
                    repeat = NO;
                    NSLog(@"Adéu!");
                } else if ([cmd isEqualToString:@"new"]) {
                    [inputCollector.commands addObject:cmd];
                    NSString *email = [inputCollector inputForPrompt:@"Email: "];
                    
                    bool contactExists = NO;
                    
                    for (Contact *contact in contacts.list) {
                        if ([contact.email isEqualToString:email]) {
                            contactExists = YES;
                        }
                    }
                    
                    if (!contactExists) {
                        NSString *name = [inputCollector inputForPrompt:@"Name: "];
                        
                        Contact *contact = [[Contact alloc] init];
                        contact.name = name;
                        contact.email = email;
                        contact.phoneNumbers = [[NSMutableDictionary alloc] init];
                        
                        bool addPhoneNumber = YES;
                        
                        while (addPhoneNumber) {
                            NSString *phoneLabel = [inputCollector inputForPrompt:@"Phone label: "];
                            NSString *phoneNumber = [inputCollector inputForPrompt:@"Phone number: "];
                            
                            NSLog(@"%@ %@", phoneLabel, phoneNumber);
                            
                            [contact.phoneNumbers setValue:phoneNumber forKey:phoneLabel];
                            
                            NSString *morePhoneNumbers = [inputCollector inputForPrompt:@"Add more phone numbers? (y/n)"];
                            
                            addPhoneNumber = [morePhoneNumbers isEqualToString:@"y"];
                        }
                        
                        [contacts addContact:contact];

                    } else {
                        NSLog(@"A contact with this email address has already been added: %@", email);
                    }
                
                } else if ([cmd isEqualToString:@"list"]) {
                    [inputCollector.commands addObject:cmd];
                    NSLog(@"%@", contacts);
                    
                } else if ([cmd isEqualToString:@"history"]) {
                    for (NSString *command in inputCollector.commands) {
                        NSLog(@"%@", command);
                    }
                
                } else {
                    NSLog(@"Not a valid input");
                }
            } else {
                NSLog(@"Not a valid input");
            }
        }
    }
    return 0;
}
